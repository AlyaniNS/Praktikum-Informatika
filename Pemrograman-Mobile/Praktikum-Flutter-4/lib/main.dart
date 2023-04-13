// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:postest4_2009106100_alyani/HomePage.dart';
import 'package:postest4_2009106100_alyani/LandingPage.dart';
import 'package:postest4_2009106100_alyani/TicketBook.dart';

void main() {
  runApp(const MaterialApp(
    home: LandingPage(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color.fromARGB(255, 199, 93, 33),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/mytix.png"),
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        //backgroundColor: Color.fromARGB(255, 199, 93, 33),
        child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 150,
                  child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.all(0),
                    accountName: Text("Alyani"),
                    accountEmail: Text("alyanins@gmail.com"),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 199, 93, 33),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 11, 15, 36),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PageOne()),
              );
            },
          ),
          ListTile(
            title: Text("Ticket"),
            leading: Icon(Icons.confirmation_num),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PageTwoInput()),
              );
            },
          ),
        ]),
      ),
      body: PageOne(),
    );
  }
}
