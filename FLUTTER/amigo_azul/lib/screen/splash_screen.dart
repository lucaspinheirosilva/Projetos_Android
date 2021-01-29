import 'package:amigo_azul/screen/home_screen.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';


class Splash_Screen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new HomeScreen(),
      title: Text(
        'Amigo Azul',
        style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,fontFamily: 'Regular'),
      ),
      image:  Image.asset("assets/img_logo.png" ),
      photoSize: 100,
      backgroundColor: Colors.blue[100],
      loaderColor: Colors.red,
      styleTextUnderTheLoader: new TextStyle(fontSize: 20,fontFamily: 'Regular',fontWeight: FontWeight.bold,color: Colors.red),
      loadingText:  Text("Carregando....Aguarde um momento..."),

    );
  }
}
