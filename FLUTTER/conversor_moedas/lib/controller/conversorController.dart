import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class ConversorController extends ChangeNotifier {
  ConversorController();

  TextEditingController tecReais = TextEditingController();
  TextEditingController tecDollar = TextEditingController();
  TextEditingController tecEuro = TextEditingController();

  var formar = NumberFormat.compact(locale: "pt_BR");

  double dolar = 0;
  double euro = 0;
  double real = 0;

  void resetCampo() {
    tecEuro.text = "";
    tecDollar.text = "";
    tecReais.text = "";

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
    tecEuro.text = formar.format(dolar * this.dolar / euro);
    tecReais.text = formar.format(dolar * this.dolar);
  }

  void euroChanged(String text) {
    if (tecEuro.text.isEmpty) {
      resetCampo();
      return;
    }
    double euro = double.parse(text);
    tecReais.text = formar.format(euro * this.euro);
    tecDollar.text = formar.format(euro * this.euro / dolar);
  }

  void realChanged(String text) {
    if (tecReais.text.isEmpty) {
      resetCampo();
      return;
    }
    double real = double.parse(text);
    tecDollar.text = formar.format(real / dolar);
    tecEuro.text = formar.format(real / euro);
  }
}
