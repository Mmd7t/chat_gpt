import 'dart:async';
import 'package:chat_gpt/config/constants/app_constants.dart';
import 'package:chat_gpt/config/extensions.dart';
import 'package:chat_gpt/core/database/shared_prefs.dart';
import 'package:chat_gpt/features/auth/presentation/pages/auth_page.dart';
import 'package:chat_gpt/features/chat/presentation/pages/home_page.dart';
import 'package:chat_gpt/features/intro/presentation/pages/onboarding/onboarding_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static const String route = '/splashScreen';
  final User? user;
  const SplashPage({super.key, this.user});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    bool isSkipedOnBoarding =
        SharedPrefsHelper.getBool(AppConstants.isSkippedOnboarding);
    Timer(
      const Duration(milliseconds: 2500),
      () {
        if (isSkipedOnBoarding) {
          if (widget.user == null) {
            Navigator.of(context).pushReplacementNamed(AuthPage.route);
          } else {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(HomePage.route, (route) => false);
          }
        } else {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(OnboardingPage.route, (route) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'applogo',
              child: 'logo'.icon(width: context.width * 0.26),
            ),
            const SizedBox(height: 40),
            'ChatGPT'.headlineLarge(context, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
