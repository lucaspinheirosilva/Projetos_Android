import 'package:flutter/material.dart';
import 'package:loja_virtual/model/carrinho_model.dart';
import 'package:loja_virtual/model/user_model.dart';
import 'package:loja_virtual/screen/home_screen.dart';
import 'package:loja_virtual/screen/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
        builder: (context,child,model){
          return ScopedModel<CarrinhoModel>(
            model: CarrinhoModel(model),
            child: MaterialApp(
              title: 'Flutter Clothing',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                primaryColor: Color.fromARGB(255, 4, 125, 141),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
            ),
          );
        },
      )
    );
  }
}
