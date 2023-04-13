import 'package:flutter/material.dart';
import 'package:postest4_2009106100_alyani/TicketBook.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 15, 36),
      body: ListView(
        children: [
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
          Container(
            margin: EdgeInsets.only(left: 80, right: 80),
            height: 60,
            child: ElevatedButton(
              child: Text("Pesan Sekarang!"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageTwoInput(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 199, 93, 33),
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
          ),
        ],
      ),
    );
  }

  Widget NowShowing() {
    return Container(
        width: 100,
        height: 50,
        margin: EdgeInsets.only(top: 30, bottom: 30),
        child: Text("Now Showing",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
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
}
