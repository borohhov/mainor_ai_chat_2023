import 'package:mainor_chat_2023/models/chat-message.dart';

class ChatGptService {
  Future<ChatMessage> getChatResponse(ChatMessage prompt) {
    return getMockResponse(prompt);
  }

  Future<ChatMessage> getMockResponse(ChatMessage prompt) async {
    ChatMessage response = ChatMessage("This is a mock response to " + prompt.message, Author.CHATGPT, DateTime.now());
    await Future.delayed(Duration(seconds: 2));
    return response;
  }
}