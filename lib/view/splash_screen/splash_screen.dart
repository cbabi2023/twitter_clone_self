import 'package:flutter/material.dart';
import 'package:twitter_clone/view/login_signup_screens/main_signin_signup_screen.dart';
import 'package:twitter_clone/view/utils/color_constants/color_constants.dart';
import 'package:twitter_clone/view/utils/image_constants/image_constants.dart';
import 'dart:async';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // A timer to navigate to the next screen after 4 seconds
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainSigninSignupScreen(),
        ),
      );
    });
    return Scaffold(
      backgroundColor: ColorConstants.mainBlack,
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            color: ColorConstants.mainBlack,
            image: DecorationImage(
              image: AssetImage(ImagesConstants.xlogo),
            ),
          ),
        ),
      ),
    );
  }
}
