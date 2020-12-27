import 'package:flutter/material.dart';

class CadastrarScreen extends StatefulWidget {
  @override
  _CadastrarScreenState createState() => _CadastrarScreenState();
}

class _CadastrarScreenState extends State<CadastrarScreen> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text("CRIAR CONTA"),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
                decoration: InputDecoration(
                  labelText: "Nome Completo",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
                validator: (texto) {
                  if (texto.isEmpty || texto.length < 3) {
                    return "Nome Inválido";
                  }
                }),
            SizedBox(
              height: 10,
            ),
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
            SizedBox(
              height: 10,
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: "Endereço",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
                validator: (texto) {
                  if (texto.isEmpty || texto.length < 3) {
                    return "Endereço Inválido";
                  }
                }),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              child: RaisedButton(
                color: primaryColor,
                onPressed: () {
                  if (_formkey.currentState.validate()) {}
                },
                child: Text(
                  "Criar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
