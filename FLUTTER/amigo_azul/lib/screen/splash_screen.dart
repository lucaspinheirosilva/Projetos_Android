import 'package:amigo_azul/scoped_model/usuario_scoped_model.dart';
import 'package:amigo_azul/screen/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

class Splash_Screen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash_Screen> {
  var nome;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UsuarioModel>(
        builder: (BuildContext context, Widget child, UsuarioModel model) {
      return SplashScreen(
        seconds: 4,
        navigateAfterSeconds: new HomeScreen(),
        title: Text(
          //faz a primeira letra ficar MAIUSCULA
          'Olá\n ${model.usuarioAtual.nome[0].toUpperCase()}${model.usuarioAtual.nome.substring(1)}',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25.0, fontFamily: ''),
        ),
        image: Image.asset("assets/img_logo.png"),
        photoSize: 100,
        backgroundColor: Colors.blue[100],
        loaderColor: Colors.red,
        styleTextUnderTheLoader: new TextStyle(
            fontSize: 20,
            fontFamily: 'Regular',
            fontWeight: FontWeight.bold,
            color: Colors.red),
        loadingText: Text("Carregando....Aguarde um momento..."),
      );
    });
  }
}
