import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:postest6_2009106100_alyani/page/DetailPage.dart';
import 'package:postest6_2009106100_alyani/page/TicketPage.dart';

class HomePage extends StatelessWidget {
  GlobalKey<ScaffoldState> homePage = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 242, 202),
      ),
      backgroundColor: Color.fromARGB(255, 133, 173, 169),
      body: ListView(
        children: [
          Container(
              width: 100,
              height: 50,
              margin: EdgeInsets.only(top: 30, bottom: 30),
              child: Text("Sedang Tayang",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: "BebasNeue",
                    color: Color.fromARGB(255, 240, 242, 202),
                  ))),
          CarouselSlider(
            items: [
              //slider 1
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/jjk.jpg'),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => jjk()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: Color.fromARGB(255, 194, 198, 210),
                    ),
                  ),
                ),
              ),
              //slider 2
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/batman.jpg'),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => batman()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: Color.fromARGB(255, 194, 198, 210),
                    ),
                  ),
                ),
              ),
              //slider 3
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/fb-sod.jpg'),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => fbsod()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: Color.fromARGB(255, 194, 198, 210),
                    ),
                  ),
                ),
              ),
              //slider 4
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/morbius.jpg'),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => morbius()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: Color.fromARGB(255, 194, 198, 210),
                    ),
                  ),
                ),
              ),
              //slider 5
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/sonic2.jpg'),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => sonic2()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
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
            options: CarouselOptions(
              height: 400,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              aspectRatio: 16 / 9,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          //booking page button
          Container(
            margin: EdgeInsets.only(left: 120, right: 120),
            height: 50,
            child: ElevatedButton(
              child: Text(
                'Pesan Tiket',
                style: TextStyle(
                    fontFamily: "Poppins",
                    color: Color.fromARGB(255, 133, 173, 169)),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => TicketPage()));
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 240, 242, 202),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 133, 173, 169),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
