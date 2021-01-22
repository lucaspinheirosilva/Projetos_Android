import 'package:amigo_azul/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class IntroScreen extends StatelessWidget {

  final pages = [
    PageViewModel(
        pageColor: const Color(0xFF03A9F4),
        bubble: Image.asset('assets/img_logo.png'),
        body: Text(
          'Um jeito divertido para aprender sobre tudo com atividades lúdicas e desafiadoras',
        ),
        title: Text(
          'Aprender',
        ),
        titleTextStyle: TextStyle(fontFamily: 'Balsan', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'Balsan', color: Colors.white),
        mainImage: Image.asset(
          'assets/img_logo.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      iconImageAssetPath: 'assets/img_logo.png',
      body: Text(
        'Uma ferramenta de comunicação para auxiliar em todos os momentos do seu dia',
      ),
      title: Text('Falar'),
      mainImage: Image.asset(
        'assets/img_logo.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'Balsan', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'Balsan', color: Colors.white),
    ),
    PageViewModel(
      pageColor: const Color(0xFF607D8B),
      iconImageAssetPath: 'assets/img_logo.png',
      body: Text(
        'Vamos ser Amigos? É rapido e fácil começarmos essa amizade',
      ),
      title: Text('Junte-se a Nós'),
      mainImage: Image.asset(
        'assets/img_logo.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'Balsan', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'Balsan', color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntroViews Flutter', //TITULO APP
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          showNextButton: true,
          showBackButton: true,
          onTapDoneButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ), //MaterialPageRoute
            );
          },
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}

/// Home Page of our example app.

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);//----->SETA PARA A TELA DO APP NA GIRAR
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ), //Appbar
      body: Center(
        child: Text("This is the home page of the app"),
      ), //Center
    ); //Scaffold
  }
}
