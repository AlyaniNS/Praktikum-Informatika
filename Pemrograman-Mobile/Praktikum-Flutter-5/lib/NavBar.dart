// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:postest5_2009106100_alyani/HomePage.dart';
import 'package:postest5_2009106100_alyani/ProfilePage.dart';
import 'package:postest5_2009106100_alyani/TicketPage.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    TicketPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      backgroundColor: Color.fromARGB(255, 133, 173, 169),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromARGB(255, 133, 173, 169),
          color: Color.fromARGB(255, 240, 242, 202),
          animationDuration: Duration(milliseconds: 300),
          onTap: _navigateBottomBar,
          items: [
            Icon(Icons.home),
            Icon(Icons.confirmation_num),
            Icon(Icons.person)
          ]),
    );
  }
}
