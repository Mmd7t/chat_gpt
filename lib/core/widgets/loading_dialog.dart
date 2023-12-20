import 'package:chat_gpt/config/extensions.dart';
import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationCurve: Curves.easeInOutBack,
      alignment: Alignment.center,
      insetAnimationDuration: const Duration(milliseconds: 1800),
      surfaceTintColor: Colors.transparent,
      backgroundColor: context.color.primary,
      child: SizedBox(
        height: 80,
        child: Center(
          child: 'Loading...'.titleMedium(context, color: Colors.white),
        ),
      ),
    );
  }
}
