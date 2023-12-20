import 'package:chat_gpt/config/enum.dart';
import 'package:chat_gpt/config/extensions.dart';
import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  final BtnType type;
  final double? width, height;
  final IconData? icon;
  final String text;
  final Color? color;
  final Color? textColor;
  final VoidCallback onTap;
  const GlobalButton({
    super.key,
    required this.onTap,
    this.icon,
    required this.text,
    this.color,
    this.textColor,
    required this.type,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width,
      height: height ?? 60,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: color ?? context.color.primary,
          foregroundColor: Colors.white,
        ),
        child: (type == BtnType.withIcon)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  text.titleMedium(context, color: Colors.white),
                  const SizedBox(width: 10),
                  Icon(icon!, color: Colors.white),
                ],
              )
            : text.titleMedium(context, color: textColor ?? Colors.white),
      ),
    );
  }
}
