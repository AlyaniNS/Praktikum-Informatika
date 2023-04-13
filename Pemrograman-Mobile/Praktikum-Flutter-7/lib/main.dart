// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors
// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postest6_2009106100_alyani/page/SplashScreen.dart';
import 'cubit/Navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyTix',
        home: Splash(),
      ),
    );
  }
}
