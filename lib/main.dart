import 'package:bmi/screens/home.dart';
import 'package:bmi/utils/constant/app_string.dart';
import 'package:bmi/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
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
      home: AnimatedSplashScreen(
          duration: 500,
          backgroundColor: Colors.blueGrey,
          splash: const Text(
            navBarHeading,
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              fontFamily: rowdiesBold,
              color: Colors.white,
            ),
          ),
          splashTransition: SplashTransition.scaleTransition,
          curve: Curves.linear,
          nextScreen: const MyHomePage()),
    );
  }
}
