import 'package:chat_gpt/config/extensions.dart';
import 'package:flutter/material.dart';

class ChatUserBubble extends StatelessWidget {
  final String text;
  const ChatUserBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8).copyWith(
              bottomRight: const Radius.circular(0),
              bottomLeft: const Radius.circular(8),
            ),
            color: context.color.primary,
          ),
          padding: const EdgeInsets.all(16),
          child: text.bodyLarge(context),
        ),
      ),
    );
  }
}
