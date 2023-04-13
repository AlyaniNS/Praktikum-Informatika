import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 15, 36),
      body: ListView(
        children: [
          Logo(),
          Greetings(),
          NowShowing(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Movie1(),
                Movie2(),
                Movie3(),
                Movie4(),
                Movie5(),
              ],
            ),
          ),
          Button(),
        ],
      ),
    );
  }

  Widget Logo() {
    return Container(
      width: 80,
      height: 160,
      margin: EdgeInsets.all(0),
      alignment: Alignment.topRight,
      child: Image(
        image: AssetImage('assets/images/mytix.png'),
      ),
    );
  }

  Widget Greetings() {
    return Container(
      height: 80,
      margin: EdgeInsets.fromLTRB(10, 5, 30, 0),
      child: Text(
        "Halo, Alyani!",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 27,
          fontFamily: 'Poppins',
          color: Color.fromARGB(255, 194, 198, 210),
        ),
      ),
    );
  }

  Widget NowShowing() {
    return Container(
        width: 100,
        height: 50,
        margin: EdgeInsets.all(10),
        child: Text("Now Showing",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50,
              fontFamily: "BebasNeue",
              color: Color.fromARGB(255, 199, 93, 33),
            )));
  }

  Widget Movie1() {
    return Container(
      width: 300,
      height: 500,
      margin: EdgeInsets.all(30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/jjk.jpg'),
        ),
      ),
    );
  }

  Widget Movie2() {
    return Container(
      width: 300,
      height: 500,
      margin: EdgeInsets.all(30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/batman.jpg'),
        ),
      ),
    );
  }

  Widget Movie3() {
    return Container(
      width: 300,
      height: 500,
      margin: EdgeInsets.all(30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/fb-sod.jpg'),
        ),
      ),
    );
  }

  Widget Movie4() {
    return Container(
      width: 300,
      height: 500,
      margin: EdgeInsets.all(30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/morbius.jpg'),
        ),
      ),
    );
  }

  Widget Movie5() {
    return Container(
      width: 300,
      height: 500,
      margin: EdgeInsets.all(30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/sonic2.jpg'),
        ),
      ),
    );
  }

  Widget Button() {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        child: Text("Pesan Sekarang!"),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 199, 93, 33),
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            color: Color.fromARGB(255, 194, 198, 210),
          ),
        ),
      ),
    );
  }
}
