import 'package:chat_gpt/features/chat/data/models/chat_message.dart';
import 'package:chat_gpt/features/chat/presentation/widgets/chat_appbar.dart';
import 'package:chat_gpt/features/chat/presentation/widgets/chat_assistant_bubble.dart';
import 'package:chat_gpt/features/chat/presentation/widgets/chat_user_bubble.dart';
import 'package:flutter/material.dart';

class UpdatesFaqPage extends StatefulWidget {
  static const String route = 'updatesFaqPage';
  const UpdatesFaqPage({super.key});

  @override
  State<UpdatesFaqPage> createState() => _UpdatesFaqPageState();
}

class _UpdatesFaqPageState extends State<UpdatesFaqPage> {
  final List<MessageModel> faqs = [
    MessageModel(
        content: 'what is ChatGPT app?',
        role: 'question',
        id: '0',
        isLiked: false),
    MessageModel(
        content: 'it is an app that uses OpenAI tools to ask your questions',
        role: 'answer',
        id: '1',
        isLiked: false),
    MessageModel(
        content: 'what is ChatGPT app?',
        role: 'question',
        id: '0',
        isLiked: false),
    MessageModel(
        content: 'it is an app that uses OpenAI tools to ask your questions',
        role: 'answer',
        id: '1',
        isLiked: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatAppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: faqs.length,
        itemBuilder: (context, index) => (faqs[index].role == 'question')
            ? ChatUserBubble(text: faqs[index].content)
            : ChatAssistantBubble(
                text: faqs[index].content,
                onLikeTapped: () {},
                onDisLikeTapped: () {},
                isFaq: true,
              ),
      ),
    );
  }
}
