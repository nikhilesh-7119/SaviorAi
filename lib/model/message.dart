class Message {
  String message;
  final MessageType msgType;

  Message({required this.msgType,required this.message});
}

enum MessageType{user,bot}
