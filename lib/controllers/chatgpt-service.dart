import 'dart:convert';

import 'package:mainor_chat_2023/models/chat-message.dart';
import 'package:http/http.dart' as http;

class ChatGptService {
  Future<ChatMessage> getChatResponse(ChatMessage prompt) {
    return getResponse(prompt);
  }

  Future<ChatMessage> getMockResponse(ChatMessage prompt) async {
    ChatMessage response = ChatMessage(
        "This is a mock response to " + prompt.message,
        Author.CHATGPT,
        DateTime.now());
    await Future.delayed(Duration(seconds: 2));
    return response;
  }

  Future<ChatMessage> getResponse(ChatMessage prompt) async {
    String requestBody =
        "{ \"prompt\": \"${prompt.message}\",\"max_tokens\": 500,\"temperature\": 0.5,\"n\": 1,\"stop\": \".\"}";
    http.Response response = await http.post(
        Uri.parse(
          'https://api.openai.com/v1/engines/text-davinci-002/completions',
        ),
        body: requestBody,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer test',
        });

    var responseMessage = json.decode(response.body);

    String rm = responseMessage['choices'][0]['text'];
    ChatMessage msg = ChatMessage(
        rm,
        Author.CHATGPT,
        DateTime.now());
    return msg;
  }
}
