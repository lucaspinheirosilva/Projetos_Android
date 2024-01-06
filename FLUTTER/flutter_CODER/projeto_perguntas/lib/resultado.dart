import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResuldado {
    if (pontuacao < 8) {
      return 'Parabens!';
    } else if (pontuacao < 12) {
      return 'Você é Bom!!';
    } else if (pontuacao < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResuldado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
          onPressed: quandoReiniciarQuestionario,
          child: Text('Reiniciar?'),
        )
      ],
    );
  }
}
