import 'package:chat_gpt/config/constants/app_constants.dart';
import 'package:chat_gpt/config/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.4),
              width: 1,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 10),
          child: AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            automaticallyImplyLeading: false,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              systemNavigationBarColor: AppConstants.bgColor,
            ),
            leadingWidth: 70,
            leading: TextButton.icon(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 16,
                color: Colors.white,
              ),
              label: 'Back'.bodyLarge(context),
            ),
            actions: [
              'logo'.iconProvider(context, size: 24, color: Colors.white),
              const SizedBox(width: 5),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight + 20);
}
