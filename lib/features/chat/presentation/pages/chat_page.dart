import 'dart:convert';
import 'dart:math';
import 'package:chat_gpt/config/constants/app_constants.dart';
import 'package:chat_gpt/config/extensions.dart';
import 'package:chat_gpt/core/database/hive_model/chat_item.dart';
import 'package:chat_gpt/core/database/hive_model/message_item.dart';
import 'package:chat_gpt/core/database/hive_model/message_role.dart';
import 'package:chat_gpt/core/widgets/global_textfield.dart';
import 'package:chat_gpt/features/chat/data/models/chat_message.dart';
import 'package:chat_gpt/features/chat/presentation/widgets/chat_appbar.dart';
import 'package:chat_gpt/features/chat/presentation/widgets/chat_assistant_bubble.dart';
import 'package:chat_gpt/features/chat/presentation/widgets/chat_user_bubble.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ChatPage extends StatefulWidget {
  static const String route = '/chatPage';
  const ChatPage({super.key, required this.chatItem});

  final ChatItem chatItem;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController controller = TextEditingController();

  final List<MessageModel> _messages = [];
  final List<OpenAIChatCompletionChoiceMessageModel> _aiMessages = [];

  late Box messageBox;

  late String appBarTitle;

  var chatResponseId = '';
  var chatResponseContent = '';

  bool isAiTyping = false;

  @override
  void initState() {
    super.initState();

    messageBox = Hive.box('messages');

    appBarTitle = widget.chatItem.title;

    for (var messageItem in widget.chatItem.messages) {
      messageItem as MessageItem;
      final textMessage = MessageModel(
        role: messageItem.role == MessageRole.ai ? 'ai' : 'user',
        id: randomString(),
        content: messageItem.message,
        isLiked: messageItem.isLiked,
      );
      _messages.insert(0, textMessage);
      _aiMessages.add(
        OpenAIChatCompletionChoiceMessageModel(
          content: [
            OpenAIChatCompletionChoiceMessageContentItemModel.text(
                messageItem.message),
          ],
          role: messageItem.role == MessageRole.ai
              ? OpenAIChatMessageRole.assistant
              : OpenAIChatMessageRole.user,
        ),
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  void _completeChat(String prompt) async {
    _aiMessages.add(OpenAIChatCompletionChoiceMessageModel(
      content: [OpenAIChatCompletionChoiceMessageContentItemModel.text(prompt)],
      role: OpenAIChatMessageRole.user,
    ));

    Stream<OpenAIStreamChatCompletionModel> chatStream =
        OpenAI.instance.chat.createStream(
      model: "gpt-3.5-turbo",
      messages: _aiMessages,
    );

    chatStream.listen((chatStreamEvent) {
      debugPrint(chatStreamEvent.toString());
      if (chatResponseId == chatStreamEvent.id) {
        chatResponseContent +=
            (chatStreamEvent.choices.first.delta.content != null)
                ? chatStreamEvent.choices.first.delta.content![0].text!
                : '';

        setState(() {
          _messages.first =
              (_messages.first).copyWith(content: chatResponseContent);
        });

        if (chatStreamEvent.choices.first.finishReason == "stop") {
          isAiTyping = false;
          _aiMessages.add(OpenAIChatCompletionChoiceMessageModel(
            content: [
              OpenAIChatCompletionChoiceMessageContentItemModel.text(
                  chatResponseContent),
            ],
            role: OpenAIChatMessageRole.assistant,
          ));
          _saveMessage(chatResponseContent, MessageRole.ai);
          chatResponseId = '';
          chatResponseContent = '';
        }
      } else {
        chatResponseId = chatStreamEvent.id;
        chatResponseContent =
            (chatStreamEvent.choices.first.delta.content != null)
                ? chatStreamEvent.choices.first.delta.content![0].text!
                : '';
        var newMessage = MessageModel(
          role: 'ai',
          id: chatResponseId.isEmpty
              ? DateTime.now().millisecondsSinceEpoch.toString()
              : chatResponseId,
          content: chatResponseContent,
          isLiked: false,
        );
        setState(() {
          _messages.insert(0, newMessage);
        });

        isAiTyping = true;
      }
    });
  }

  /// Save message to Hive database
  void _saveMessage(String message, MessageRole role) {
    final messageItem = MessageItem(message, role, DateTime.now(), false);
    messageBox.add(messageItem);
    widget.chatItem.messages.add(messageItem);
    widget.chatItem.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: _messages.isEmpty
                    ? Center(
                        child: 'Ask anything, get yout answer'.bodyLarge(
                          context,
                          color: Colors.white.withOpacity(0.4),
                        ),
                      )
                    : ListView.builder(
                        reverse: true,
                        itemCount: _messages.length,
                        itemBuilder: (context, index) =>
                            (_messages[index].role == 'user')
                                ? ChatUserBubble(text: _messages[index].content)
                                : ChatAssistantBubble(
                                    text: _messages[index].content,
                                    onLikeTapped: () {},
                                    onDisLikeTapped: () {},
                                  ),
                      ),
              ),
              GlobalTextField(
                controller: controller,
                hint: '',
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: AppConstants.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () {
                      final textMessage = MessageModel(
                        role: 'user',
                        id: randomString(),
                        content: controller.text,
                        isLiked: false,
                      );

                      setState(() {
                        _messages.insert(0, textMessage);
                      });
                      _saveMessage(controller.text, MessageRole.user);
                      _completeChat(controller.text);
                      controller.text = '';
                    },
                    icon: 'send'
                        .iconProvider(context, size: 20, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
