import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  String texto;
  void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: ElevatedButton(
        onPressed: quandoSelecionado,
        child: Text(texto),
      ),
    );
  }
}
