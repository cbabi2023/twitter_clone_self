import 'package:flutter/material.dart';

import 'package:twitter_clone/view/splash_screen/splash_screen.dart';
import 'package:twitter_clone/view/utils/color_constants/color_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ColorConstants.mainBlack,
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorConstants.mainBlack,
          actionsIconTheme: IconThemeData(
            color: ColorConstants.mainWhite,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: ColorConstants.mainWhite),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
