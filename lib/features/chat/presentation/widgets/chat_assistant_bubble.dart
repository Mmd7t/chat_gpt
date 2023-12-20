import 'dart:math';

import 'package:chat_gpt/config/extensions.dart';
import 'package:flutter/material.dart';

class ChatAssistantBubble extends StatelessWidget {
  final VoidCallback onLikeTapped;
  final VoidCallback onDisLikeTapped;
  final String text;
  final bool isFaq;
  const ChatAssistantBubble({
    super.key,
    required this.text,
    required this.onLikeTapped,
    required this.onDisLikeTapped,
    this.isFaq = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8).copyWith(
                  bottomRight: const Radius.circular(8),
                  bottomLeft: const Radius.circular(0),
                ),
                color: Colors.white.withOpacity(0.2),
              ),
              padding: const EdgeInsets.all(16),
              child: text.bodyLarge(context),
            ),
            if (!isFaq)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: onLikeTapped,
                    icon: 'like'
                        .iconProvider(context, size: 20, color: Colors.white),
                  ),
                  Transform.rotate(
                    angle: pi,
                    child: IconButton(
                      onPressed: onDisLikeTapped,
                      icon: 'like'
                          .iconProvider(context, size: 20, color: Colors.white),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: 'copy'
                        .iconProvider(context, size: 20, color: Colors.white),
                    label: 'Copy'.bodyMedium(context),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
