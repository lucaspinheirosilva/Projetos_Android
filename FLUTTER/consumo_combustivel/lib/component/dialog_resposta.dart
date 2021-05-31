import 'package:flutter/material.dart';

Future<void> showDialoginformation(
  @required BuildContext context,
  @required String titulo,
  @required String conteudo,
) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(conteudo),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"))
          ],
          elevation: 24.0,
          backgroundColor: Colors.white,
        );
      });
}
