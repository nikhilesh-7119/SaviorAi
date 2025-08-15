import 'package:ai_assisstance/helper/global.dart';
import 'package:ai_assisstance/model/message.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const r = Radius.circular(15);
    return message.msgType == MessageType.bot
        ?
          //bot
          Row(
            children: [
              SizedBox(width: 6),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Image.asset('assets/images/logo.png', width: 24),
              ),

              Container(
                constraints: BoxConstraints(maxWidth: mq.width * 0.6),
                margin: EdgeInsets.only(
                  bottom: mq.height * .02,
                  left: mq.width * .02,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: mq.height * .01,
                  horizontal: mq.width * .03,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.only(
                    topLeft: r,
                    topRight: r,
                    bottomRight: r,
                  ),
                ),
                child: Text(message.message, textAlign: TextAlign.center),
              ),
            ],
          )
        :
          //user
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: mq.width * 0.6),
                margin: EdgeInsets.only(
                  bottom: mq.height * .02,
                  right: mq.width * .02,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: mq.height * .01,
                  horizontal: mq.width * .03,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.only(
                    topLeft: r,
                    topRight: r,
                    bottomLeft: r,
                  ),
                ),
                child: Text(message.message, textAlign: TextAlign.center),
              ),

              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.blue),
              ),

              SizedBox(width: 6),
            ],
          );
  }
}
