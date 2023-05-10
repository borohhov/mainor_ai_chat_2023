class ChatMessage {
  String message;
  Author author;
  DateTime dateTime;

  ChatMessage(this.message, this.author, this.dateTime);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map['message'] = message;
    map['author'] = author.toString();
    map['dateTime'] = dateTime.toString();
    return map;
  }

  static ChatMessage fromJson(Map<String, dynamic> map) {
    Author a = Author.values.firstWhere((e) => e.toString() == map["author"]);
    return ChatMessage(map['message'], a, DateTime.parse(map["dateTime"]));

  }
}


enum Author {
  CHATGPT, USER
}


