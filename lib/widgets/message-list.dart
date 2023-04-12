import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mainor_chat_2023/controllers/chat-controller.dart';
import 'package:mainor_chat_2023/models/chat-message.dart';
import 'package:provider/provider.dart';

class MessageList extends StatelessWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ChatMessage> messages =
        Provider.of<ChatController>(context).getAllMessages();
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: Column(
        children: messages.map((m) {
          double leftPadding = m.author == Author.USER ? 100.0 : 0.0;
          double rightPadding = m.author == Author.CHATGPT ? 100.0 : 0.0;
          return Row(
            children: [
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                        left: leftPadding,
                        right: rightPadding),
                    child: Container(
                      color: m.author == Author.USER
                          ? Colors.yellow
                          : Colors.lightBlueAccent,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              border:
                                  Border.all(width: 1, color: Colors.black26)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                Text(
                                  m.message,
                                  maxLines: 15,
                                  softWrap: true,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      DateFormat('MMM dd HH:mm')
                                          .format(m.dateTime),
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                  ))
            ],
          );
        }).toList(),
      ),
    );
  }
}
