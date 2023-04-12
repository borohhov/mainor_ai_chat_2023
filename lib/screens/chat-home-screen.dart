import 'package:flutter/material.dart';
import 'package:mainor_chat_2023/widgets/message-input.dart';
import 'package:mainor_chat_2023/widgets/message-list.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChatHomeScreenState();


}

class ChatHomeScreenState extends State<ChatHomeScreen> {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Talk to ChatGPT"),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left:8.0, right: 8.0, bottom: 8.0),
            child: SingleChildScrollView(
                controller: controller,
                child: MessageList()),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MessageInputWidget()
          )
        ],
      ),
    );
  }
}
