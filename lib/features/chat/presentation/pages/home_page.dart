import 'package:chat_gpt/config/constants/app_constants.dart';
import 'package:chat_gpt/core/database/hive_model/chat_item.dart';
import 'package:chat_gpt/features/chat/presentation/widgets/home_appbar.dart';
import 'package:chat_gpt/features/chat/presentation/widgets/home_bottom_sector.dart';
import 'package:chat_gpt/features/chat/presentation/widgets/home_chat_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatelessWidget {
  static const String route = '/homePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.darkColor,
      appBar: const HomeAppBar(),
      body: ValueListenableBuilder(
          valueListenable: Hive.box('chats').listenable(),
          builder: (context, box, _) {
            return Column(
              children: [
                Expanded(
                  child: (box.isEmpty)
                      ? const SizedBox()
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemCount: box.length,
                          itemBuilder: (context, index) {
                            final chatItem = box.getAt(index) as ChatItem;
                            return HomeChatCard(
                              chatItem: chatItem,
                              box: box,
                              index: index,
                            );
                          },
                        ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.white.withOpacity(0.4),
                        width: 1,
                      ),
                    ),
                  ),
                  child: HomeBottomSector(box: box),
                ),
              ],
            );
          }),
    );
  }
}
