import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const requisicao =
    "https://api.hgbrasil.com/finance?format=json-cors&key=c770a2f7";

void main() async {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          hintStyle: TextStyle(color: Colors.amber),
        )),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double dolar;
  double euro;

  final realController = new TextEditingController();
  final dolarController = new TextEditingController();
  final euroController = new TextEditingController();

  void _realMudanca(String texto) {
    double real = double.parse(texto);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }
  void _dolarMudanca(String texto) {
    double dolar = double.parse(texto);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }
  void _euroMudanca(String texto) {
    double euro = double.parse(texto);
    realController.text=(euro * this.euro).toStringAsFixed(2);
    dolarController.text=(euro * this.euro / dolar).toStringAsFixed(2);
  }
  void ResetarCampos(){
    realController.text="";
    dolarController.text="";
    euroController.text="";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon( Icons.refresh),
              onPressed: ResetarCampos)
        ],
      ),
      body: FutureBuilder<Map>(
          future: PegarDados(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                    child: Text(
                  "Carregando Dados",
                  style: TextStyle(color: Colors.amber, fontSize: 25),
                  textAlign: TextAlign.center,
                ));
              default:
                if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    "Erro ao Carregar Dados!!",
                    style: TextStyle(color: Colors.amber, fontSize: 25),
                    textAlign: TextAlign.center,
                  ));
                } else {
                  dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                  euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Icon(
                          Icons.monetization_on,
                          size: 150,
                          color: Colors.amber,
                        ),
                        criarTextField(
                            "Real", "RS ", realController, _realMudanca),
                        Divider(),
                        criarTextField(
                            "Dollar", "US\$ ", dolarController, _dolarMudanca),
                        Divider(),
                        criarTextField(
                            "Euro", "€ ", euroController, _euroMudanca),
                      ],
                    ),
                  );
                }
            }
          }),
    );
  }
}

Future<Map> PegarDados() async {
  http.Response response = await http.get(requisicao);
  return json.decode(response.body);
}

Widget criarTextField(String labelText, String prefixText,
    TextEditingController controlador, Function mudanca) {
  return TextField(
    controller: controlador,
    decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.amber),
        border: OutlineInputBorder(),
        prefixText: prefixText),
    style: TextStyle(color: Colors.amber, fontSize: 25),
    onChanged: mudanca,
    keyboardType: TextInputType.number,
  );
}
