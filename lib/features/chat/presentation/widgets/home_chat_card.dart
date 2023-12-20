import 'package:chat_gpt/config/constants/app_constants.dart';
import 'package:chat_gpt/config/extensions.dart';
import 'package:chat_gpt/core/database/hive_model/chat_item.dart';
import 'package:chat_gpt/features/chat/presentation/pages/chat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeChatCard extends StatelessWidget {
  final ChatItem chatItem;
  final Box box;
  final int index;
  const HomeChatCard({
    super.key,
    required this.chatItem,
    required this.box,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.4),
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(5),
        leading: const Icon(Icons.chat_bubble_outline_rounded),
        title: Text(chatItem.title),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ChatPage(chatItem: chatItem);
          }));
        },
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PopupMenuButton<String>(
              position: PopupMenuPosition.under,
              offset: const Offset(0, 10),
              constraints: BoxConstraints(minWidth: context.width * 0.45),
              tooltip: 'More Options',
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              iconColor: Colors.white,
              elevation: 0.0,
              onSelected: (value) {
                switch (value) {
                  case "Edit":
                    break;
                  case "Delete":
                    box.deleteAt(index);
                    break;

                  default:
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: "Edit",
                  child: ListTile(
                    title: "Edit".bodyMedium(context),
                    leading: const Icon(Icons.edit),
                  ),
                ),
                PopupMenuItem(
                  value: "Delete",
                  child: ListTile(
                    title: "Delete".bodyMedium(
                      context,
                      color: AppConstants.errorColor,
                    ),
                    leading: const Icon(
                      CupertinoIcons.delete,
                      color: AppConstants.errorColor,
                    ),
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
