import 'package:chat_gpt/config/constants/app_constants.dart';
import 'package:chat_gpt/config/enum.dart';
import 'package:chat_gpt/config/extensions.dart';
import 'package:chat_gpt/core/database/shared_prefs.dart';
import 'package:chat_gpt/core/widgets/global_btn.dart';
import 'package:chat_gpt/features/auth/presentation/pages/auth_page.dart';
import 'package:chat_gpt/features/intro/data/models/onboarding_model.dart';
import 'package:chat_gpt/features/intro/presentation/widgets/indicators.dart';
import 'package:chat_gpt/features/intro/presentation/widgets/onboarding_label.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  static const String route = '/onboardingPage';
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;
  int onboardingCIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  List<OnboardingModel> onboardingData = [
    OnboardingModel(
      icon: 'examples',
      title: 'Examples',
      labels: [
        '“Explain quantum computing in simple terms”',
        '“Got any creative ideas for a 10 year old’s birthday?”',
        '“How do I make an HTTP request in Javascript?”',
      ],
    ),
    OnboardingModel(
      icon: 'capabilities',
      title: 'Capabilities',
      labels: [
        'Remembers what user said earlier in the conversation',
        'Allows user to provide follow-up corrections',
        'Trained to decline inappropriate requests',
      ],
    ),
    OnboardingModel(
      icon: 'limitations',
      title: 'Limitations',
      labels: [
        'May occasionally generate incorrect information',
        'May occasionally produce harmful instructions or biased content',
        'Limited knowledge of world and events after 2021',
      ],
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 38),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'applogo',
                        child: 'logo'.icon(width: 24),
                      ),
                      const SizedBox(height: 24),
                      'Welcome to\nChatGPT'
                          .headlineLarge(context, color: Colors.white),
                      const SizedBox(height: 24),
                      'Ask anything, get your answer'
                          .bodyLarge(context, color: Colors.white),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: onboardingData.length,
                        onPageChanged: (index) {
                          setState(() {
                            onboardingCIndex = index;
                          });
                        },
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              onboardingData[index].icon.icon(width: 20),
                              const SizedBox(height: 12),
                              onboardingData[index]
                                  .title
                                  .titleLarge(context, color: Colors.white),
                              const SizedBox(height: 40),
                              ...List.generate(
                                onboardingData.length,
                                (i) => Column(
                                  children: [
                                    OnboardingLabel(
                                      label: onboardingData[index].labels[i],
                                    ),
                                    SizedBox(
                                        height: (i == onboardingData.length - 1)
                                            ? 0
                                            : 16),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Indicators(cIndex: onboardingCIndex),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: GlobalButton(
                  onTap: () async {
                    if (onboardingCIndex == onboardingData.length - 1) {
                      SharedPrefsHelper.save(
                          key: AppConstants.isSkippedOnboarding, value: true);

                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AuthPage.route, (route) => false);
                    } else {
                      onboardingCIndex++;
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  width: context.width,
                  icon: Icons.arrow_forward_rounded,
                  text: (onboardingCIndex == onboardingData.length - 1)
                      ? 'Let\'s Chat'
                      : 'Next',
                  type: (onboardingCIndex == onboardingData.length - 1)
                      ? BtnType.withIcon
                      : BtnType.withoutIcon,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
