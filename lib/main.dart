import 'package:flutter/material.dart';
import 'package:mainor_chat_2023/controllers/chat-controller.dart';
import 'package:mainor_chat_2023/screens/chat-home-screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ChatController(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChatHomeScreen(),
    );
  }
}
