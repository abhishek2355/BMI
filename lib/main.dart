import 'package:bmi/screens/home.dart';
import 'package:bmi/utils/constant/app_string.dart';
import 'package:bmi/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const SplashScreen());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      child: AnimatedSplashScreen(
          duration: 500,
          backgroundColor: Colors.blueGrey,
          splash: Center(
            child: Text(
              navBarHeading,
              style: TextStyle(
                fontSize: media.height * 60 / 926,
                fontWeight: FontWeight.bold,
                fontFamily: rowdiesBold,
                color: Colors.white,
              ),
            ),
          ),
          splashTransition: SplashTransition.scaleTransition,
          curve: Curves.linear,
          nextScreen: const MyHomePage()),
    );
  }
}
