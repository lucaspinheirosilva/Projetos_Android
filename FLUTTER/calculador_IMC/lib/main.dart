import 'dart:io';

import 'package:calculador_imc/pages/calculadora_IMC_desktop.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart' as window_size;

void main() {
  if (!kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      window_size.setWindowMinSize(const Size(400, 200));
      window_size.setWindowMaxSize(const Size(800, 800));
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculadora IMC',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => Calc_IMC_Main();
}

class Calc_IMC_Main extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double larguraTela = MediaQuery.of(context).size.width;
    kDebugMode ? print('A LARGURA DA TELA È DE : $larguraTela') : null;
    //return larguraTela<= 450.0?mobileLayout(context):desktopLayout(context);
    return Calc_IMC_Desktop() ;

  }
}
