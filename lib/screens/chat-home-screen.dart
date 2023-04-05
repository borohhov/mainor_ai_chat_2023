import 'package:flutter/material.dart';
import 'package:mainor_chat_2023/widgets/message-list.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Talk to ChatGPT"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [SingleChildScrollView(child: MessageList()),Align(alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                Expanded(flex: 10, child: TextField()),
                ElevatedButton(onPressed: null, child: Icon(Icons.airplane_ticket_outlined))
              ],),)],
        ),
      ),
    );
  }
}
