import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/chat-message.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({Key? key, required this.message}) : super(key: key);
  final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    double leftPadding = message.author == Author.USER ? 100.0 : 0.0;
    double rightPadding = message.author == Author.CHATGPT ? 100.0 : 0.0;
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
                color: message.author == Author.USER
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
                            message.message,
                            maxLines: 15,
                            softWrap: true,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                DateFormat('MMM dd HH:mm')
                                    .format(message.dateTime),
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
  }
}
