import 'package:flutter/material.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 133, 173, 169),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 240, 242, 202),
          title: Text(
            'Tiket',
            style: TextStyle(color: Color.fromARGB(255, 133, 173, 169)),
          ),
        ),
        body: Center(child: Image.asset('assets/images/ticket.jpg')));
  }
}
