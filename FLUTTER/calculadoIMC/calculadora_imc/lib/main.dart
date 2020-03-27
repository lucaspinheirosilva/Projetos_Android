import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String informacao = "Informe os seus Dados!!";

  void resetarCampos() {
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      informacao = "Informe os seus Dados!!";
    });

  }

  void Calcular() {
    setState(() {
      double d_peso = double.parse(pesoController.text);
      double d_altura = double.parse(alturaController.text) / 100;

      double imc = d_peso / pow(d_altura, 2);

      if (imc < 10) {
        informacao = "Desnutrição Grau V";
      } else if (imc >= 10 && imc <= 12.9) {
        informacao = "Desnutrição Grau IV";
      } else if (imc >= 13 && imc <= 15.9) {
        informacao = "Desnutrição Grau III (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 16 && imc <= 16.9) {
        informacao = "Desnutrição Grau II (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 17 && imc <= 18.4) {
        informacao = "Desnutrição Grau I (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.5 && imc <= 24.9) {
        informacao = "Normal  (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 25 && imc <= 29.9) {
        informacao = "PréObesidade  (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 30 && imc <= 34.5) {
        informacao = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 35 && imc <= 39.9) {
        informacao = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 40) {
        informacao = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Claculado de IMC"),
          backgroundColor: Colors.green,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: resetarCampos,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            //ALINHA TUDO QUE ESTA NA COLUNA
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //ICONE
              Icon(Icons.person_outline, size: 120, color: Colors.green),

              //PESO
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (Kg)",
                    labelStyle: TextStyle(color: Colors.green)),
                style: TextStyle(color: Colors.green, fontSize: 25),
                controller: pesoController,
              ),

              //ALTURA
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (Cm)",
                    labelStyle: TextStyle(color: Colors.green)),
                style: TextStyle(color: Colors.green, fontSize: 25),
                controller: alturaController,
              ),

              //BOTÃO
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                    height: 50,
                    child: RaisedButton(
                      onPressed: Calcular,
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      color: Colors.green,
                    )),
              ),
              Text(
                informacao,
                style: TextStyle(color: Colors.green, fontSize: 25),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
