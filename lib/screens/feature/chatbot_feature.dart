import 'package:ai_assisstance/controllers/chat_controller.dart';
import 'package:ai_assisstance/helper/global.dart';
import 'package:ai_assisstance/widget/message_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChatbotFeature extends StatefulWidget {
  const ChatbotFeature({super.key});

  @override
  State<ChatbotFeature> createState() => _ChatbotFeatureState();
}

class _ChatbotFeatureState extends State<ChatbotFeature> {
  @override
  Widget build(BuildContext context) {
    final _chatController = Get.put(ChatController());

    return Scaffold(
      appBar: AppBar(title: Text('Chat with Ai assistance')),
      //send message field and button
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //   child: Row(
      //     children: [
      //       Expanded(
      //         child: TextFormField(
      //           controller: _chatController.textC,
      //           textAlign: TextAlign.center,
      //           onTapOutside: (e) => FocusScope.of(context).unfocus(),
      //           decoration: InputDecoration(
      //             fillColor: Colors.white,
      //             filled: true,
      //             isDense: true,
      //             hintText: 'Ask me anything you want...',
      //             hintStyle: TextStyle(fontSize: 14),
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.all(Radius.circular(50)),
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(width: 8),
      //       //send button
      //       CircleAvatar(
      //         radius: 24,
      //         child: IconButton(
      //           onPressed: _chatController.askQuestion,
      //           icon: Icon(
      //             Icons.rocket_launch_rounded,
      //             color: Colors.blue,
      //             size: 28,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Obx(
                () => ListView(
                  reverse: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                    top: mq.height * .02,
                    bottom: mq.height * .01,
                  ),
                  children: _chatController.list
                      .map((e) => MessageCard(message: e))
                      .toList(),
                ),
              ),
            ),

            //customized bottom bar with reversed list
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0,left: 8,right: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _chatController.textC,
                      textAlign: TextAlign.center,
                      onTapOutside: (e) => FocusScope.of(context).unfocus(),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        isDense: true,
                        hintText: 'Ask me anything you want...',
                        hintStyle: TextStyle(fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),

                  //send button
                  CircleAvatar(
                    radius: 24,
                    child: IconButton(
                      onPressed: _chatController.askQuestion,
                      icon: Icon(
                        Icons.rocket_launch_rounded,
                        color: Colors.blue,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
