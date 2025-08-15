import 'package:ai_assisstance/helper/global.dart';
import 'package:ai_assisstance/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;
  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      margin: EdgeInsets.only(bottom: mq.width * .02),
      color: Colors.blue.withOpacity(0.2),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        onTap: homeType.onTap,
        child: homeType.leftAlign
            ? Row(
                children: [
                  Container(
                    width: mq.width * .35,
                    child: Padding(
                      padding: homeType.padding,
                      child: Lottie.asset(
                        'assets/lottie/${homeType.lottie}',
                        width: mq.width * .35,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    homeType.title,
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(flex: 2),
                ],
              )
            : Row(
                children: [
                  Spacer(flex: 2),
                  Text(
                    homeType.title,
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: mq.width * .35,
                    child: Padding(
                      padding: homeType.padding,
                      child: Lottie.asset('assets/lottie/${homeType.lottie}'),
                    ),
                  ),
                ],
              ),
      ),
    ).animate().fade(duration: 2.seconds,curve: Curves.easeIn);
  }
}
