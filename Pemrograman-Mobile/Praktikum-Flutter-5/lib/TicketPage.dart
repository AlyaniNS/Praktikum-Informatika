import 'package:flutter/material.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 240, 242, 202),
          title: Text(
            'Tiket',
            style: TextStyle(color: Color.fromARGB(255, 133, 173, 169)),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 133, 173, 169),
        body: ListView(
          children: [
            //tiket 1
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                height: 160,
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(255, 240, 242, 202),
                child: Text(
                    " Film: The Batman \n Jam Tayang: 14:00 \n Nama: Alyani",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color.fromARGB(255, 133, 173, 169),
                      height: 3,
                    )),
              ),
            ),

            //tiket 2
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                height: 160,
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(255, 240, 242, 202),
                child:
                    Text(" Film: Morbius \n Jam Tayang: 20:00 \n Nama: Maple",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          color: Color.fromARGB(255, 133, 173, 169),
                          height: 3,
                        )),
              ),
            ),

            //tiket 3
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                height: 160,
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(255, 240, 242, 202),
                child:
                    Text(" Film: Sonic 2 \n Jam Tayang: 12:00 \n Nama: dummy",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          color: Color.fromARGB(255, 133, 173, 169),
                          height: 3,
                        )),
              ),
            ),

            //tiket 4
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                height: 160,
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(255, 240, 242, 202),
                child: Text(
                    " Film: Fantastic Beasts: Secret of Dumbledore \n Jam Tayang: 16:00 \n Nama: BLu",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color.fromARGB(255, 133, 173, 169),
                      height: 3,
                    )),
              ),
            ),

            //tiket 5
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                height: 160,
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(255, 240, 242, 202),
                child: Text(
                    " Film: Jujutsu Kaisen 0 \n Jam Tayang: 10:00 \n Nama: Athir",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color.fromARGB(255, 133, 173, 169),
                      height: 3,
                    )),
              ),
            ),
          ],
        ));
  }
}
