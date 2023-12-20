import 'package:chat_gpt/config/extensions.dart';
import 'package:flutter/material.dart';

class HomeListTile extends StatelessWidget {
  final String title;
  final String icon;
  final Color? color;
  final Widget? trailing;
  final VoidCallback? onTap;
  const HomeListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.color,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: title.bodyLarge(context, color: color ?? Colors.white),
      leading:
          icon.iconProvider(context, size: 20, color: color ?? Colors.white),
      trailing: trailing,
    );
  }
}
