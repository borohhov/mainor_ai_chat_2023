import 'package:flutter/material.dart';
import 'package:mainor_chat_2023/controllers/chat-controller.dart';
import 'package:mainor_chat_2023/models/chat-message.dart';
import 'package:provider/provider.dart';

class MessageInputWidget extends StatefulWidget {
  const MessageInputWidget({Key? key}) : super(key: key);

  @override
  State<MessageInputWidget> createState() => _MessageInputWidgetState();
}

class _MessageInputWidgetState extends State<MessageInputWidget> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xDAFFCC33),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              flex: 10,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(controller: _textEditingController,),
              )),
          ElevatedButton(
              onPressed: () {
                if(_textEditingController.value.text.isNotEmpty) {
                  ChatMessage message = ChatMessage(
                      _textEditingController.value.text, Author.USER,
                      DateTime.now());
                  Provider.of<ChatController>(context, listen: false)
                      .addMessage(message);
                  _textEditingController.text = "";
                }
              }, child: Icon(Icons.airplane_ticket_outlined))
        ],
      ),
    );
  }
}
