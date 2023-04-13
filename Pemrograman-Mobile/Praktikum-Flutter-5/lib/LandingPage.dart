// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:postest5_2009106100_alyani/NavBar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingPage extends StatelessWidget {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 133, 173, 169),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                children: [
                  Center(
                    child: Image.asset("assets/images/landing1.JPG"),
                  ),
                  Center(
                    child: Image.asset("assets/images/landing2.JPG"),
                  ),
                  Center(
                    child: Image.asset("assets/images/landing3.JPG"),
                  )
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              axisDirection: Axis.horizontal,
              effect: WormEffect(
                  type: WormType.normal,
                  activeDotColor: Color.fromARGB(255, 240, 242, 202),
                  dotColor: Colors.black,
                  dotHeight: 15,
                  dotWidth: 15,
                  spacing: 8),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 240, 242, 202),
        foregroundColor: Color.fromARGB(255, 133, 173, 169),
        mini: true,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NavBar()),
          );
        },
        child: Icon(
          Icons.navigate_next,
        ),
      ),
    );
  }
}
