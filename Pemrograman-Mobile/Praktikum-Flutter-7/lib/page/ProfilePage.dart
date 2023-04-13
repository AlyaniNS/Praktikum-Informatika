import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 133, 173, 169),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/ava.png",
              width: 80,
              height: 80,
            ),
            SizedBox(height: 30),
            Text(
              "Alyani Noor Septalia",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  color: Color.fromARGB(255, 240, 242, 202)),
            ),
            Text(
              "2009106100",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Color.fromARGB(255, 240, 242, 202)),
            )
          ],
        ),
      ),
    );
  }
}
