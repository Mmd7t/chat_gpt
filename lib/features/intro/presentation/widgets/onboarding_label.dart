import 'package:chat_gpt/config/extensions.dart';
import 'package:flutter/material.dart';

class OnboardingLabel extends StatelessWidget {
  final String label;
  const OnboardingLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
      width: context.width,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: label.bodyLarge(
        context,
        color: Colors.white,
        align: TextAlign.center,
      ),
    );
  }
}
