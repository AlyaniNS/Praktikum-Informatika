import 'package:flutter/material.dart';
import 'package:postest3_2009106100_alyani/page_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post Test 3 - Alyani Noor Septalia',
      home: PageOne(),
    );
  }
}
