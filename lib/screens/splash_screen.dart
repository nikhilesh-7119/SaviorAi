import 'package:ai_assisstance/helper/global.dart';
import 'package:ai_assisstance/helper/pref.dart';
import 'package:ai_assisstance/screens/home_screen.dart';
import 'package:ai_assisstance/screens/onboarding_screen.dart';
import 'package:ai_assisstance/widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // wait for time on splash and then move to next screen
    Future.delayed(Duration(seconds: 2), () {
      // Navigator.of(
      //   context,
      // ).pushReplacement(MaterialPageRoute(builder: (_) => Pref.showOnboarding ? const OnboardingScreen() : const HomeScreen()));
      Get.off(
        () =>
            Pref.showOnboarding ? const OnboardingScreen() : const HomeScreen(),
      );
      
    });
  }

  @override
  Widget build(BuildContext context) {
    //initializing device size
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        // height: mq.height,
        child: Column(
          children: [
            Spacer(flex: 2),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.all(mq.width * 0.05),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: mq.width * 0.45,
                ),
              ),
            ),
            //for adding some space
            Spacer(),
            //lottie loading
            CustomLoading(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
