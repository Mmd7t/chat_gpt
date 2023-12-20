import 'package:chat_gpt/config/extensions.dart';
import 'package:flutter/material.dart';

class SwitchText extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoginForm;
  const SwitchText({
    super.key,
    required this.onTap,
    this.isLoginForm = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (isLoginForm ? 'Don\'t have an account? ' : 'Already have an account? ')
            .bodySmall(context),
        GestureDetector(
          onTap: onTap,
          child: (isLoginForm ? 'Sign up' : 'Sign in').labelLarge(
            context,
            weight: FontWeight.w700,
            color: context.color.primary,
          ),
        ),
      ],
    );
  }
}
