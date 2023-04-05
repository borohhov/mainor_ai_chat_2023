class ChatMessage {
  String message;
  Author author;
  DateTime dateTime;

  ChatMessage(this.message, this.author, this.dateTime);
}


enum Author {
  CHATGPT, USER
}

List<ChatMessage> getDemoMessages () {
  List<ChatMessage> messages = [];
  messages.add(ChatMessage("Hello", Author.USER, DateTime.now()));
  messages.add(ChatMessage("I would like to overlay a Round view on top of a background View just like in this screenshot below", Author.CHATGPT, DateTime.now()));
  messages.add(ChatMessage("How can I put a widget above another widget in Flutter?", Author.USER, DateTime.now()));
  messages.add(ChatMessage("I would like to overlay a Round view on top of a background View just like in this screenshot below", Author.CHATGPT, DateTime.now()));
  messages.add(ChatMessage("How can I put a widget above another widget in Flutter?", Author.USER, DateTime.now()));
  messages.add(ChatMessage("I would like to overlay a Round view on top of a background View just like in this screenshot below", Author.CHATGPT, DateTime.now()));
  messages.add(ChatMessage("How can I put a widget above another widget in Flutter?", Author.USER, DateTime.now()));
  messages.add(ChatMessage("I would like to overlay a Round view on top of a background View just like in this screenshot below", Author.CHATGPT, DateTime.now()));
  messages.add(ChatMessage("How can I put a widget above another widget in Flutter?", Author.USER, DateTime.now()));
  messages.add(ChatMessage("I would like to overlay a Round view on top of a background View just like in this screenshot below", Author.CHATGPT, DateTime.now()));
  messages.add(ChatMessage("How can I put a widget above another widget in Flutter?", Author.USER, DateTime.now()));
  return messages;
}