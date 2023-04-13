// ignore_for_file: file_names, unnecessary_new

import 'package:flutter/material.dart';
import 'package:postest5_2009106100_alyani/HomePage.dart';
import 'package:postest5_2009106100_alyani/LandingPage.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: LandingPage(),
      image: Image.asset("assets/images/mytix.png"),
      photoSize: 50.0,
      backgroundColor: Color.fromARGB(255, 133, 173, 169),
      useLoader: false,
    );
  }
}
