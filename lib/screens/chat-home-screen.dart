import 'package:flutter/material.dart';
import 'package:mainor_chat_2023/widgets/message-list.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Talk to ChatGPT"),
      ),
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(left:8.0, right: 8.0, bottom: 8.0),
            child: SingleChildScrollView(child: MessageList()),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Color(0xDAFFCC33),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Expanded(
                      flex: 10,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(),
                      )),
                  ElevatedButton(
                      onPressed: null,
                      child: Icon(Icons.airplane_ticket_outlined))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
