import 'package:flutter/material.dart';
import 'package:mainor_chat_2023/controllers/firebase/firestore-controller.dart';
import 'package:mainor_chat_2023/controllers/persistence-controller.dart';
import 'package:mainor_chat_2023/models/chat-message.dart';

import 'chatgpt-service.dart';

class ChatController extends ChangeNotifier {
  List<ChatMessage> messages = [];
  PersistenceController db = FirestoreController();

  Future<void> addMessage(ChatMessage message) async {
    messages.add(message);
    db.saveMessage(message);
    waitForResponse(message);
    notifyListeners();
  }

  Future<void> waitForResponse(ChatMessage message) async {
    ChatMessage response = await ChatGptService().getChatResponse(message);
    messages.add(response);
    db.saveMessage(response);
    notifyListeners();
  }

  Future<List<ChatMessage>> getAllMessages() async {
    return db.getAllMessages();
    //return messages;
  }
}