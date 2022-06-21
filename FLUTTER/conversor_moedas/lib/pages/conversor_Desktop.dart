import 'dart:async';

import 'package:conversor_moedas/controller/conversorController.dart';
import 'package:conversor_moedas/widgets/campoTexto.dart';
import 'package:conversor_moedas/widgets/error.dard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Conversor_Desktop extends StatefulWidget {
  const Conversor_Desktop({Key? key}) : super(key: key);

  @override
  State<Conversor_Desktop> createState() => _Conversor_DesktopState();
}

class _Conversor_DesktopState extends State<Conversor_Desktop> {
  late ConversorController controller;

  @override
  build(BuildContext context) {
    controller = context.watch<ConversorController>();
    return FutureBuilder(
      future: controller.getData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.amber,
              ),
            );
          default:
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  "Falha ao Carregar",
                  style: TextStyle(fontSize: 25, color: Colors.amber),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              Map map = snapshot.data! as Map;
              if (map.containsKey("error")) {
                return error(context, map["message"]);
              } else {
                controller.dolar = map["results"]["currencies"]["USD"]["sell"];
                controller.euro = map["results"]["currencies"]["EUR"]["sell"];
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: Colors.amber,
                            size: MediaQuery.of(context).size.width / 15,
                          ),
                          InputTextPersonalizado(
                              tecTexto: controller.tecReais,
                              label: "Reais",
                              prefix: "R\$",
                              funcao: controller.realChanged),
                          InputTextPersonalizado(
                              tecTexto: controller.tecDollar,
                              label: "Dolar",
                              prefix: "\$",
                              funcao: controller.dolarChanged),
                          InputTextPersonalizado(
                              tecTexto: controller.tecEuro,
                              label: "Euro",
                              prefix: "€",
                              funcao: controller.euroChanged),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }
        }
      },
    );
  }

  void resetCampo() {
    controller.tecEuro.text = "";
    controller.tecDollar.text = "";
    controller.tecReais.text = "";
  }
}
