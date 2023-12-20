import 'package:chat_gpt/config/extensions.dart';
import 'package:chat_gpt/features/auth/presentation/widgets/login_form.dart';
import 'package:chat_gpt/features/auth/presentation/widgets/signup_form.dart';
import 'package:chat_gpt/features/auth/presentation/widgets/switch_text.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  static const String route = '/authPage';
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLoginForm = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SizedBox(
            height: context.height,
            child: Column(
              children: [
                Expanded(
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: 'applogo',
                          child: 'logo'.icon(width: context.width * 0.24),
                        ),
                        const SizedBox(height: 40),
                        'ChatGPT'.headlineMedium(context, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                (isLoginForm) ? const LoginForm() : const SignupForm(),
                SwitchText(
                  isLoginForm: isLoginForm,
                  onTap: () {
                    setState(() {
                      isLoginForm = !isLoginForm;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
