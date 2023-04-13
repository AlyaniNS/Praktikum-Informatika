// ignore_for_file: file_names, unnecessary_new, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:postest6_2009106100_alyani/page/LandingPage.dart';
import 'package:postest6_2009106100_alyani/page/NavBar.dart';
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
