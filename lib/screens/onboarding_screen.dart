import 'package:ai_assisstance/helper/global.dart';
import 'package:ai_assisstance/model/onboard.dart';
import 'package:ai_assisstance/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    final list = [
      Onboard(
        lottie: 'ai_ask_me',
        subtittle:
            'I can be your bestfriend & you can ask me anything & I will help you',
        tittle: 'Ask me anything',
      ),
      Onboard(
        lottie: 'ai_play',
        subtittle:
            'Just imagine anything and let me know, I will create something wonderful for you',
        tittle: 'Imagination to reality',
      ),
    ];
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final isLast = index == list.length - 1;
          return Column(
            children: [
              //lottie
              Lottie.asset(
                'assets/lottie/${list[index].lottie}.json',
                height: mq.height * .6,
                width: isLast ? mq.width * .7 : null,
              ),
              //tittle
              Text(
                list[index].tittle,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.15,
                ),
              ),
              SizedBox(height: mq.height * 0.01),
              //subtittle
              SizedBox(
                width: mq.width * .7,
                child: Text(
                  list[index].subtittle,
                  style: TextStyle(
                    fontSize: 13.5,
                    letterSpacing: 0.5,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              //dots
              Wrap(
                spacing: 10,
                children: List.generate(
                  list.length,
                  (i) => Container(
                    width: i == index ? 15 : 10,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == index ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
              ),
              Spacer(),
              //button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: StadiumBorder(),
                  elevation: 0,
                  minimumSize: Size(mq.width * .4, 50),
                  // textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),
                ),
                onPressed: () {
                  if (isLast) {
                    Get.off(HomeScreen());
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(builder: (_) => HomeScreen()),
                    // );
                  } else {
                    pageController.nextPage(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.ease,
                    );
                  }
                },
                child: Text(
                  isLast ? 'Finish' : 'Next',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}
