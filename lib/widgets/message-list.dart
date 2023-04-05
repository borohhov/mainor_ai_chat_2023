import 'package:flutter/material.dart';
import 'package:mainor_chat_2023/models/chat-message.dart';

class MessageList extends StatelessWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getDemoMessages().map((m) {
        double leftPadding = m.author == Author.USER ? 100.0 : 0.0;
        double rightPadding = m.author == Author.CHATGPT ? 100.0 : 0.0;
        return Row(
          children: [
            Expanded( flex: 5, child: Padding(
              padding: EdgeInsets.only(
                top: 8,
                bottom: 8,
                left: leftPadding,
                right: rightPadding
              ),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)),border: Border.all(width: 1, color: Colors.black26)),
                  child: Text(m.message, maxLines: 15, softWrap: true,)),
            ))],
        );
      }).toList(),
    );
  }
}
