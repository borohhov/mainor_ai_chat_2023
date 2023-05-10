import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mainor_chat_2023/controllers/chat-controller.dart';
import 'package:mainor_chat_2023/models/chat-message.dart';
import 'package:mainor_chat_2023/widgets/chat-message-widget.dart';
import 'package:provider/provider.dart';

class MessageList extends StatelessWidget {
  const MessageList({Key? key, this.scrollController}) : super(key: key);
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChatMessage>>(
        future: Provider.of<ChatController>(context).getAllMessages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          else if (snapshot.hasError) {
            return const Text("Could not load messages");
          }
          scrollController?.animateTo(
              scrollController!.position.maxScrollExtent,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOut);
          return Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: Column(
              children: (snapshot.data ?? []).map((m) {
                return ChatMessageWidget(message: m);
              }).toList(),
            ),
          );
        });
  }
}
