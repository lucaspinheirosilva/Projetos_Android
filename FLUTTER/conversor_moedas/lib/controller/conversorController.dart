import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConversorController extends ChangeNotifier {
  ConversorController();

  TextEditingController tecReais = TextEditingController();
  TextEditingController tecDollar = TextEditingController();
  TextEditingController tecEuro = TextEditingController();

  double dolar = 0;
  double euro = 0;
  double real = 0;

   void resetCampo() {
    tecEuro.text = "";
    tecDollar.text = "";
    tecReais.text = "";
    notifyListeners();
  }

  Future<Map> getData() async {
    const requisicao = "https://api.hgbrasil.com/finance?key=47f95d24";
    http.Response response = await http.get(Uri.parse(requisicao));
    return json.decode(response.body);
  }

  void dolarChanged(String text) {
    if (tecDollar.text.isEmpty) {
      resetCampo();
      return;
    }
    double dolar = double.parse(text);
    tecEuro.text = (dolar * this.dolar / euro).toString();
    tecReais.text = (dolar * this.dolar) .toString();
  }

  void euroChanged(String text) {
    if (tecEuro.text.isEmpty) {
      resetCampo();
      return;
    }
    double euro = double.parse(text);
    tecReais.text = (euro * this.euro) .toString();
    tecDollar.text = (euro * this.euro / dolar).toString();
  }

  void realChanged(String text) {
    if (tecReais.text.isEmpty) {
      resetCampo();
      return;
    }
    double real = double.parse(text);
    tecDollar.text = (real / dolar) .toString();
    tecEuro.text = (real / euro).toString();
  }
}
