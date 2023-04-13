import 'package:flutter/material.dart';
import 'package:postest4_2009106100_alyani/HomePage.dart';
import 'package:postest4_2009106100_alyani/main.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 15, 36),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/iconLandingPage.png"),
                ),
              ),
            ),
            SizedBox(height: 50),
            Text(
              "MyTix",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  color: Color.fromARGB(255, 194, 198, 210)),
            ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.only(left: 80, right: 80),
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 199, 93, 33),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                ),
                child: Icon(
                  Icons.arrow_right_outlined,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
