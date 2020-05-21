///https://medium.com/flutter-comunidade-br/criando-um-chatbot-com-flutter-e-dialogflow-f828e5301101

import 'package:flutter/material.dart';
import 'package:vetorhelp/views/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primarySwatch: Colors.deepOrange
    ),
    home: HomePage(),
  ));
}