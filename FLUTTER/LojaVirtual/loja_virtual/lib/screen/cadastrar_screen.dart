import 'package:flutter/material.dart';
import 'package:loja_virtual/model/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CadastrarScreen extends StatefulWidget {
  @override
  _CadastrarScreenState createState() => _CadastrarScreenState();
}

class _CadastrarScreenState extends State<CadastrarScreen> {
  final _formkey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _enderecoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CRIAR CONTA",
        ),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Form(
            key: _formkey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: <Widget>[
                TextFormField(
                    controller: _nomeController,
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
                    controller: _emailController,
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
                    controller: _senhaController,
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
                    controller: _enderecoController,
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
                      if (_formkey.currentState.validate()) {
                        Map<String, dynamic> data = {
                          "nome": _nomeController,
                          "email": _emailController,
                          "endereco": _enderecoController,
                        };

                        model.cadastrar(
                            userData: data,
                            pass: _senhaController.text,
                            onSuccess: _onSuccess,
                            onFail: _onFail);
                      }
                    },
                    child: Text(
                      "Criar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onSuccess() {
    return null;
  }

  void _onFail() {
    return print("ERRO");
  }
}
