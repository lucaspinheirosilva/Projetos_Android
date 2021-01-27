import 'package:amigo_azul/screen/intro_screen.dart';
import 'package:amigo_azul/screen/login_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      //home: IntroScreen(),

    );
  }
}


