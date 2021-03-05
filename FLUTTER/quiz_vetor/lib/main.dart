import 'package:flutter/material.dart';
import 'package:quiz_vetor/pages/quiz_login.dart';
import 'package:quiz_vetor/pages/quiz_page.dart';
import 'package:quiz_vetor/scopedModel/usuario_model.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UsuarioModel>(
      model: UsuarioModel(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String,WidgetBuilder>{
        'login':(BuildContext)=>new Quiz_Login(),
        'quizPage':(BuildContext)=>new QuizPage(),
      },
      title: 'Quiz Vetor Sistemas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: QuizPage(),
      home: Quiz_Login(),
    ),
    );
  }
}