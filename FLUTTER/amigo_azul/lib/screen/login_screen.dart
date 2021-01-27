import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _radioValue = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]); //----->SETA PARA A TELA DO APP NA GIRAR
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.8,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87,
                      blurRadius: 30.0,
                      spreadRadius: 5.0,
                    )
                  ],
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                  ),
                ),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset("assets/img_logo.png"),
                    ),
                    Text(
                      "Amigo Azul",
                      style: TextStyle(
                          fontFamily: "Regular",
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: <Widget>[
                  Container(
                    //-----------------------------> NOME
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(color: Colors.transparent),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black54, blurRadius: 15)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Informe seu Nome:",
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          icon: Icon(
                            Icons.account_box_outlined,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    //--------------------------------> IDADE
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(color: Colors.transparent),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black54, blurRadius: 15)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [LengthLimitingTextInputFormatter(3)],
                        decoration: InputDecoration(
                          hintText: "Informe sua Idade:",
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          icon: Icon(
                            Icons.adjust_outlined,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    //-----------------------------> E-MAIL
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(color: Colors.transparent),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black54, blurRadius: 15)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Informe seu E-mail:",
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          icon: Icon(
                            Icons.alternate_email,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    //--------------------------------> SENHA
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(color: Colors.transparent),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black54, blurRadius: 15)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Informe sua Senha:",
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          icon: Icon(
                            Icons.vpn_key_outlined,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                  ),
                  Container(
                    //----------------GRAU TEA
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Radio(
                                value: 1,
                                groupValue: _radioValue,
                                onChanged: _escolhaRadioButton),
                            Expanded(
                              child: Text(
                                "Nível 1: LEVE (necessidade de pouco suporte)",
                                overflow: TextOverflow.fade,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Radio(
                                value: 2,
                                groupValue: _radioValue,
                                onChanged: _escolhaRadioButton),
                            Expanded(
                              child: Text(
                                "Nível 2: MODERADO (necessitam de suporte)",
                                overflow: TextOverflow.fade,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Radio(
                                value: 3,
                                groupValue: _radioValue,
                                onChanged: _escolhaRadioButton),
                            Expanded(
                              child: Text(
                                "Nível 3: SEVERO (necessidade de maior suporte/apoio)",
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 1.6,
                      height: 50,
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.blueAccent,
                        splashColor: Colors.white,
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Icon(
                              Icons.save_outlined,
                              size: 36,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10,),
                            Text(
                              "GRAVAR",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Regular",
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _escolhaRadioButton(int valor) {
    setState(() {
      _radioValue = valor;

      switch (_radioValue) {
        case 1:
          print("ESCOLHEU 1");
          break;
        case 2:
          print("ESCOLHEU 2");
          break;
        case 3:
          print("ESCOLHEU 3");
          break;
      }
    });
  }
}
