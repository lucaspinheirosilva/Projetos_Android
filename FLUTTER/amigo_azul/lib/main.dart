
import 'package:amigo_azul/screen/cadastro_user_screen.dart';
import 'package:flutter/material.dart';
import 'screen/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: CadastroUsuario(),
      //home: IntroScreen(),
      home: LoginUsuario(),

    );
  }
}


