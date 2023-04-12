import 'package:flutter/material.dart';
import 'package:mainor_chat_2023/models/chat-message.dart';

class ChatController extends ChangeNotifier {
  List<ChatMessage> messages = [];
  void addMessage(ChatMessage message) {
    messages.add(message);
    notifyListeners();
  }

  List<ChatMessage> getAllMessages() {
    return messages;
  }
}