import 'dart:io';

import 'package:buscador_gifs/pages/buscador_Desktop.dart';
import 'package:buscador_gifs/pages/buscador_Mobile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart' as window_size;

Future<void> main() async {
  if (!kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      var tamanhoTelaFullScren = await window_size.getCurrentScreen();
      double comprimentoTela = tamanhoTelaFullScren?.frame.width ?? 0;
      double alturaTela = tamanhoTelaFullScren?.frame.height ?? 0;
      debugPrint("LARGURA ->$comprimentoTela ALTURA->$alturaTela");

      window_size
          .setWindowMinSize(Size(comprimentoTela / 1.7, alturaTela / 1.7));
      window_size
          .setWindowMaxSize(Size(comprimentoTela / 1.7, alturaTela / 1.7));
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buscador de Gifs',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double larguraTela = MediaQuery.of(context).size.width;
    double alturaTela = MediaQuery.of(context).size.height;
    debugPrint("LARGURA $larguraTela ---------ALTURA $alturaTela");

    return Scaffold(
      body: larguraTela <= 500 ? BuscadorMobile() : BuscadorDesktop(),
    );
  }
}
