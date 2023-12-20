import 'package:chat_gpt/config/constants/app_constants.dart';
import 'package:chat_gpt/config/extensions.dart';
import 'package:chat_gpt/core/database/hive_model/chat_item.dart';
import 'package:chat_gpt/features/chat/presentation/pages/chat_page.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 30),
        child: InkWell(
          focusColor: AppConstants.darkColor,
          highlightColor: AppConstants.darkColor,
          splashColor: AppConstants.darkColor,
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            OpenAI.apiKey = dotenv.get('API_KEY');

            // create hive object
            final messagesBox = Hive.box('messages');
            final newChatTitle =
                'Chat ${DateFormat('d/M/y').format(DateTime.now())}';
            var chatItem = ChatItem(newChatTitle, HiveList(messagesBox));

            // add to hive
            Hive.box('chats').add(chatItem);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatPage(chatItem: chatItem),
              ),
            );
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white.withOpacity(0.4),
                  width: 1,
                ),
              ),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
                systemNavigationBarColor: AppConstants.darkColor,
              ),
              leadingWidth: 30,
              leading: const Icon(Icons.chat_bubble_outline_rounded),
              title: 'New Chat'.titleMedium(context, color: Colors.white),
              actions: const [Icon(Icons.arrow_forward_ios_rounded)],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight + 35);
}
