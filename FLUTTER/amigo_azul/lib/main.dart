
import 'package:amigo_azul/screen/cadastro_user_screen.dart';
import 'package:amigo_azul/screen/home_screen.dart';
import 'package:amigo_azul/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'screen/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    routes: <String,WidgetBuilder>{//****Rotas para chamada de outras telas
      '/login':(BuildContext)=>new LoginUsuario(),
      '/cadastrar_usuario':(BuildContext)=>new CadastroUsuario(),
      //'/sentimentos':(BuildContext)=>new LoginUsuario(),
      //'/objetos':(BuildContext)=>new LoginUsuario(),
     // '/montar_frases':(BuildContext)=>new LoginUsuario(),
      '/splash_screen':(BuildContext)=>new Splash_Screen(),
      '/home_screen':(BuildContext)=>new HomeScreen(),
    },
      home: LoginUsuario(),

    );
  }
}


