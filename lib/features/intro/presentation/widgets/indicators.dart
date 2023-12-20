import 'package:chat_gpt/config/extensions.dart';
import 'package:flutter/material.dart';

class Indicators extends StatelessWidget {
  final int cIndex;
  const Indicators({super.key, required this.cIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          height: 2,
          width: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: (index == cIndex)
                ? context.color.primary
                : Colors.white.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
