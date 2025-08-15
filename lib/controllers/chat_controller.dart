import 'package:ai_assisstance/apis/api.dart';
import 'package:ai_assisstance/model/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final textC=TextEditingController();
  final list=<Message>[Message(msgType: MessageType.bot, message: 'Hello, How can I help you?')].obs;

  void askQuestion()async{
    if(textC.text.trim().isNotEmpty){
      //user
      list.insert(0,Message(msgType: MessageType.user, message: textC.text.trim()));
      list.insert(0,Message(msgType: MessageType.bot, message: 'Please wait'));

      final res=await Api.getAnswer(textC.text.trim());

      //ai bot
      list.removeAt(0);
      list.insert(0,Message(msgType: MessageType.bot, message: res.trim()));

      textC.text='';
    }
  }
}