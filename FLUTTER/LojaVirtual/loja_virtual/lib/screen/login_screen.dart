import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loja_virtual/model/user_model.dart';
import 'package:loja_virtual/screen/cadastrar_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text("ENTRAR", style: TextStyle(fontSize: 24)),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => CadastrarScreen()));
            },
            color: primaryColor,
            child: Text(
              "CRIAR CONTA",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          )
        ],
      ),
      body: ScopedModelDescendant<UserModel>(builder: (context, child, model) {
        return Form(
          key: _formkey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (texto) {
                    if (texto.isEmpty || !texto.contains("@")) {
                      return "E-mail Inválido";
                    }
                  }),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: "Senha",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (texto) {
                    if (texto.isEmpty || texto.length < 6) {
                      return ("Senha Inválida");
                    }
                  }),
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {},
                  child: Text("Esqueci minha senha"),
                  padding: EdgeInsets.zero,
                ),
              ),
              SizedBox(
                height: 40,
                child: RaisedButton(
                  color: primaryColor,
                  onPressed: () {
                    if (_formkey.currentState.validate()) {}
                  },
                  child: Text(
                    "Entrar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
