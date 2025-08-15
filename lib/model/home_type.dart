import 'package:ai_assisstance/screens/feature/chatbot_feature.dart';
import 'package:ai_assisstance/screens/feature/image_feature.dart';
import 'package:ai_assisstance/screens/feature/translator_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

enum HomeType {
  aiChatBot, aiImage, aiTranslator
}

extension MyHomeType on HomeType{
  String get title => switch(this){
    HomeType.aiChatBot => 'Ai Chat Bot',
    HomeType.aiImage => 'Ai Image Creator',
    HomeType.aiTranslator => 'Language translator',
  };

  String get lottie => switch(this){
    HomeType.aiChatBot => 'ai_hand_waving.json',
    HomeType.aiImage => 'ai_play.json',
    HomeType.aiTranslator => 'ai_ask_me.json',
  };

  bool get leftAlign => switch(this){
    HomeType.aiChatBot => true,
    HomeType.aiImage => false,
    HomeType.aiTranslator => true,
  };

  EdgeInsets get padding => switch(this){
    HomeType.aiChatBot => EdgeInsets.zero,
    HomeType.aiImage => EdgeInsets.all(20),
    HomeType.aiTranslator => EdgeInsets.zero,
  };

  VoidCallback get onTap => switch(this){
    HomeType.aiChatBot => ()=> Get.to(()=>ChatbotFeature()) ,
    HomeType.aiImage => ()=> Get.to(()=>ImageFeature()) ,
    HomeType.aiTranslator => ()=> Get.to(()=>TranslatorFeature())  ,
  };
}