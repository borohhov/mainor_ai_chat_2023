import 'package:mainor_chat_2023/models/chat-message.dart';

abstract class PersistenceController {
  Future<List<ChatMessage>> getAllMessages();

  Future<void> saveMessage(ChatMessage message);
}