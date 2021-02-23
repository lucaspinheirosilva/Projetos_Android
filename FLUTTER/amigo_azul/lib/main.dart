import 'package:amigo_azul/scoped_model/usuario_scoped_model.dart';
import 'package:amigo_azul/screen/cadastro_user_screen.dart';
import 'package:amigo_azul/screen/home_screen.dart';
import 'package:amigo_azul/screen/intro_screen.dart';
import 'package:amigo_azul/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UsuarioModel>(
        model: UsuarioModel(),
        child: MaterialApp(
          routes: <String, WidgetBuilder>{
            //****Rotas para chamada de outras telas
            '/login': (BuildContext) => new LoginUsuario(),
            '/cadastrar_usuario': (BuildContext) => new CadastroUsuario(),
            //'/sentimentos':(BuildContext)=>new LoginUsuario(),
            //'/objetos':(BuildContext)=>new LoginUsuario(),
            // '/montar_frases':(BuildContext)=>new LoginUsuario(),
            '/splash_screen': (BuildContext) => new Splash_Screen(),
            '/home_screen': (BuildContext) => new HomeScreen(),
            '/intro_screen': (BuildContext) => new IntroScreen(),
          },
          home: LoginUsuario(),
         // home: CadastroUsuario(),
        ));
  }
}
