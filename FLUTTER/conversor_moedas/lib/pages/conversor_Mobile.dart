import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/conversorController.dart';
import '../widgets/campoTexto.dart';
import '../widgets/error.dart';

class Conversor_Mobile extends StatefulWidget {
  const Conversor_Mobile({Key? key}) : super(key: key);

  @override
  State<Conversor_Mobile> createState() => _Conversor_MobileState();
}

class _Conversor_MobileState extends State<Conversor_Mobile> {
  late ConversorController controller;
  @override
  Widget build(BuildContext context) {
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
                return errorMobile(context, map["message"]);
              } else {
                controller.dolar = map["results"]["currencies"]["USD"]["sell"];
                controller.euro = map["results"]["currencies"]["EUR"]["sell"];
                return Center(
                  child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.1,
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
                              size: MediaQuery.of(context).size.width / 5,
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
                  ),
                );
              }
            }
        }
      },
    );
  }
}
