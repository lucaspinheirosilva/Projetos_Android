import 'package:calculador_imc/controller/calculadorIMC_controller.dart';
import 'package:calculador_imc/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Calc_IMC_Desktop extends StatefulWidget {
  const Calc_IMC_Desktop({Key? key}) : super(key: key);

  @override
  State<Calc_IMC_Desktop> createState() => _Calc_IMC_DesktopState();
}

String resultado = "Informe seus dados!";
String? errorTextAltura;
String? errorTextPeso;
TextEditingController tecAltura = TextEditingController();
TextEditingController tecPeso = TextEditingController();

class _Calc_IMC_DesktopState extends State<Calc_IMC_Desktop> {
  resetCampos() {
    tecAltura.text = "";
    tecPeso.text = "";
    setState(() {
      resultado = "Informe seus dados!";
      errorTextPeso = null;
      errorTextAltura = null;
    });
  }

  calcularIMC() {
    try {
      double altura = double.parse(tecAltura.text) / 100;
      double peso = double.parse(tecPeso.text);
      double imc = peso / (altura * altura);
      String imcString = imc.toStringAsPrecision(5);
      print(imc);
      errorTextPeso = null;
      errorTextAltura = null;

      setState(() {
        if (imc < 18.5) {
          resultado = "seu IMC é de : $imcString voce esta com MAGREZA!";
        } else if (imc >= 18.5 && imc <= 24.9) {
          resultado =
              "seu IMC é de : $imcString voce esta com seu peso NORMAL!";
        } else if (imc >= 25 && imc <= 29.99) {
          resultado = "seu IMC é de : $imcString voce esta com SOBREPESO!";
        } else if (imc >= 30 && imc <= 34.9) {
          resultado =
              "seu IMC é de : $imcString voce esta com OBESIDADE GRAU I!";
        } else if (imc >= 35 && imc <= 39.9) {
          resultado =
              "seu IMC é de : $imcString voce esta com OBESIDADE GRAU II!";
        } else if (imc >= 40) {
          resultado =
              "seu IMC é de : $imcString voce esta com OBESIDADE GRAU III!";
        }
      });
    } on FormatException catch (e) {
      print(e);
      setState(() {
        resultado =
            "algum dos valores informador não esta com o Valor correto!";
      });
    } catch (e) {
      print(e);
      setState(() {
        resultado = "Falha ao tentar calcular seu IMC";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 5,
        title: const Text("Calculadora IMC"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: resetCampos,
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.person_outline_rounded,
              color: Colors.green,
              size: 125,
            ),
            CampoTexto(
                tec: tecAltura,
                errorText: errorTextAltura,
                label: "Altura",
                hinText: "Informe sua altura em CM",
                caminhoImagem: "assets/icones/altura.png"),
            const Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
            CampoTexto(
                tec: tecPeso,
                errorText: errorTextPeso,
                label: "Peso",
                hinText: "Informe seu peso em Kg",
                caminhoImagem: "assets/icones/peso.png"),
            const Padding(padding: EdgeInsets.only(top: 10, bottom: 5)),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 3,

                  offset: const Offset(3, 3), // changes position of shadow
                ),
              ]),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.green, padding: const EdgeInsets.all(15)),
                onPressed: () {
                  if (tecAltura.text.isEmpty || tecPeso.text.isEmpty) {
                    setState(() {
                      if (tecAltura.text.isEmpty) {
                        errorTextAltura = "campo obrigatório";
                      } else {
                        errorTextAltura = null;
                      }
                      if (tecPeso.text.isEmpty) {
                        errorTextPeso = "campo obrigatório";
                      } else {
                        errorTextPeso = null;
                      }
                    });
                  } else {
                    calcularIMC();
                  }
                },
                child: const Text(
                  "Calcular",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                resultado,
                style: const TextStyle(fontSize: 25, color: Colors.green),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
