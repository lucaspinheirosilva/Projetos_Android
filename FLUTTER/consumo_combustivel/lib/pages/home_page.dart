import 'package:consumo_combustivel/component/dialog_resposta.dart';
import 'package:consumo_combustivel/component/inputsDados.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controllerConsumoGasolina = new TextEditingController();
  final controllerConsumoAlcool = new TextEditingController();
  final controlleCronsumoDiesel = new TextEditingController();
  final controllePrecoGasolina = new TextEditingController();
  final controllePrecoAlcool = new TextEditingController();
  final controllePrecoDiesel = new TextEditingController();
  final controlleValorAbastecer = new TextEditingController();


  bool _validadarConsumoGasolina = false;
  bool _validadarConsumoAlcool = false;
  bool _validadarConsumoDiesel = false;

  bool _validadarValorGasolina = false;
  bool _validadarValorAlcooh = false;
  bool _validadarValorDiesel = false;

  bool _validadarPagar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Center(
                //--*-*-*-*-*-*-*-*-*-*-*-*-LOGO
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white54,
                            blurRadius: 7,
                            offset: Offset(0, 0))
                      ]),
                  child: Image.asset(
                    "/logoApp.png",
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.white54,
                height: 5,
              ),
              //*-*-*-*-*-*-*-*-*-*-*-*-*-*-DADOS CONSUMO
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 5, bottom: 10, top: 10),
                  child: Text(
                    "Dados de Consumo do Veiculo por KM/L",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InputDados(
                        context,
                        _validadarConsumoGasolina ? "preencha!" : null,
                        controllerConsumoGasolina,
                        'GASOLINA',
                        '/icon_consumo.png',
                        "Km/L",
                        Colors.orange[700],
                        Colors.white,
                        3),
                    InputDados(
                        context,
                        _validadarConsumoAlcool ? "preencha!" : null,
                        controllerConsumoAlcool,
                        'ALCOOL',
                        '/icon_consumo.png',
                        "Km/L",
                        Colors.orange[700],
                        Colors.white,
                        3),
                    InputDados(
                        context,
                        _validadarConsumoDiesel?"preencha!" : null,
                        controlleCronsumoDiesel,
                        'DIESEL',
                        '/icon_consumo.png',
                        "Km/L",
                        Colors.orange[700],
                        Colors.white,
                        3),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.white54,
                height: 5,
              ),
              //-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-PREÇO COMBUSTIVEL
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 5, bottom: 10, top: 10),
                  child: Text(
                    "Valores dos preços dos combustíveis",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        InputDados(
                            context,
                            _validadarValorGasolina ? "preencha!" : null,
                            controllePrecoGasolina,
                            '',
                            '/icon_dinheiro.png',
                            "R\$",
                            Colors.white,
                            Colors.black,
                            3),
                        Expanded(
                          child: Text(
                            "Preço do litro da GASOLINA",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        InputDados(
                            context,
                            _validadarValorAlcooh ? "preencha!" : null,
                            controllePrecoAlcool,
                            '',
                            '/icon_dinheiro.png',
                            "R\$",
                            Colors.white,
                            Colors.black,
                            3),
                        Expanded(
                          child: Text(
                            "Preço do litro do ALCOOL",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        InputDados(
                            context,
                            _validadarValorDiesel ? "preencha!" : null,
                            controllePrecoDiesel,
                            '',
                            '/icon_dinheiro.png',
                            "R\$",
                            Colors.white,
                            Colors.black,
                            3),
                        Expanded(
                          child: Text(
                            "Preço do litro do DIESEL",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      alignment: Alignment.center,
                      child: Text(
                        "Valor em R\$ que pretende abastecer",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: InputDados(
                          context,
                          _validadarPagar ? "preencha!" : null,
                          controlleValorAbastecer,
                          "",
                          "/icon_pagamento.png",
                          'R\$',
                          Colors.blue,
                          Colors.transparent,
                          2),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(360)),
                      width: MediaQuery.of(context).size.width / 3,
                      height: 200,
                      child: TextButton(
                          onPressed: () async {
                            setState(() {
                              // ||
                              if (controllerConsumoGasolina.text.isEmpty &&
                                  controllerConsumoAlcool.text.isEmpty &&
                                  controlleCronsumoDiesel.text.isEmpty) {
                                _validadarConsumoDiesel = true;
                                _validadarConsumoAlcool = true;
                                _validadarConsumoGasolina = true;
                                showDialoginformation(context, "Ops!!",
                                    " Os campos de CONSUMO DE COMBUSTIVEIS são campos obrigatórios \n Favor preencher pelo menos UM dos campos em laranja ");
                              } else {
                                _validadarConsumoDiesel = false;
                                _validadarConsumoAlcool = false;
                                _validadarConsumoGasolina = false;
                              }
                              if (controllePrecoGasolina.text.isEmpty &&
                                  controllePrecoAlcool.text.isEmpty &&
                                  controllePrecoDiesel.text.isEmpty) {

                                _validadarValorGasolina = true;
                                _validadarValorDiesel = true;
                                _validadarValorAlcooh = true;
                                showDialoginformation(context, "Ops!!",
                                    " Os campos de PREÇOS DOS COMBUSTIVEIS são campos obrigatórios \n Favor preencher pelo menos UM dos campos");
                              }else {
                                _validadarValorGasolina = false;
                                _validadarValorDiesel = false;
                                _validadarValorAlcooh = false;
                              }if (controlleValorAbastecer.text.isEmpty) {
                                _validadarPagar = true;
                                showDialoginformation(context, 'Ops!!!',
                                    'Favor preencher o valor a ser abastecido');
                              }else {
                                _validadarPagar = false;
                              }
                            });
                          },
                          child: Lottie.asset(
                            '/json_botaoCalcular.JSON',
                            fit: BoxFit.fill,
                            repeat: true,
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
