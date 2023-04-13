import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postest6_2009106100_alyani/page/HomePage.dart';
import 'package:postest6_2009106100_alyani/page/ProfilePage.dart';
import 'package:postest6_2009106100_alyani/page/TicketPage.dart';
import 'package:postest6_2009106100_alyani/cubit/Navigator.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final _pageNavigation = [
    HomePage(),
    TicketPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: _buildBody(state),
          bottomNavigationBar: _buildBottomNav(),
        );
      },
    );
  }

  Widget _buildBody(int index) {
    return _pageNavigation.elementAt(index);
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 240, 242, 202),
      currentIndex: context.read<BottomNavCubit>().state,
      type: BottomNavigationBarType.fixed,
      onTap: _getChangeBottomNav,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          backgroundColor: Color.fromARGB(255, 133, 173, 169),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.confirmation_num),
          label: "Tiket",
          backgroundColor: Color.fromARGB(255, 133, 173, 169),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profil",
          backgroundColor: Color.fromARGB(255, 133, 173, 169),
        )
      ],
    );
  }

  void _getChangeBottomNav(int index) {
    context.read<BottomNavCubit>().updateIndex(index);
  }
}
