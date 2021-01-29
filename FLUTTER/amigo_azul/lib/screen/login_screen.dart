import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class LoginUsuario extends StatefulWidget {
  @override
  _LoginUsuarioState createState() => _LoginUsuarioState();
}

class _LoginUsuarioState extends State<LoginUsuario> {
  bool _validadorEmail = false;
  bool _validadorSenha = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;

    if (largura < 400) {
      return CELULAR();
    } else
      return TABLET();
  }

  //===========================================================================================================>VERSAO CELULAR
  Widget CELULAR() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                //***********cabeçalho com a logo
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height / 3.3),
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
                      width: 150,
                      height: 150,
                      child: Image.asset("assets/img_logo.png"),
                    ),
                    Text(
                      "Amigo Azul",
                      style: TextStyle(
                          fontFamily: "Regular",
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: 70,
              ),
              Center(
                child: Container(
                  //************caixa LOGIN
                  padding: EdgeInsets.only(
                    bottom: 12,
                    left: 12,
                    right: 12,
                  ),
                  width: MediaQuery.of(context).size.width - 50,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    border: Border.all(color: Colors.black, width: 1),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: 20.0,
                        spreadRadius: 5.0,
                      )
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        //*************titulo LOGIN
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: "Regular",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      criarTextField(
                          //***********************************EMAIL CELULAR
                          "Informe seu email",
                          TextInputType.emailAddress,
                          Icons.email_outlined,
                          _validadorEmail
                              ? "Email nao pode estar em branco"
                              : null,
                          emailController),
                      SizedBox(
                        height: 20,
                      ),
                      criarTextField(
                          //***********************************SENHA TABLET
                          "Informe sua Senha",
                          TextInputType.text,
                          Icons.vpn_key_outlined,
                          _validadorSenha
                              ? "senha nao pode estar em branco"
                              : null,
                          senhaController),
                      Divider(
                        color: Colors.transparent,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        //******************************botao entrar CELULAR
                        width: MediaQuery.of(context).size.width / 1.6,
                        height: 50,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            backgroundColor: Colors.blueAccent,
                            shadowColor: Colors.black,
                            elevation: 5,
                          ),
                          onPressed: () {
                            setState(() {
                              if (emailController.text.isEmpty) {
                                _validadorEmail = true;
                              } else {
                                _validadorEmail = false;
                              }
                              if (senhaController.text.isEmpty) {
                                _validadorSenha = true;
                              } else {
                                _validadorSenha = false;
                              }
                              if (!emailController.text.isEmpty &&
                                  !senhaController.text.isEmpty) {
                                loginBD();
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Icon(
                                Icons.login,
                                size: 36,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "ENTRAR",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "Regular",
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        //************************NAO TENHO CADASTRO

                        width: MediaQuery.of(context).size.width / 2,
                        height: 30,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            backgroundColor: Colors.brown,
                            shadowColor: Colors.black,
                            elevation: 5,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context,
                                '/cadastrar_usuario'); //chama tela de cadastro de usuario
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Icon(
                                Icons.assignment_late_outlined,
                                size: 16,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Não tenho cadastro",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: "Regular",
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //============================================================================================================================>VERSAO TABLET

  Widget TABLET() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height / 3.3),
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
                      width: 150,
                      height: 150,
                      child: Image.asset("assets/img_logo.png"),
                    ),
                    Text(
                      "Amigo Azul",
                      style: TextStyle(
                          fontFamily: "Regular",
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: 80,
              ),
              Center(
                child: Container(
                    padding: EdgeInsets.only(
                      bottom: 20,
                      left: 20,
                      right: 20,
                    ),
                    width: MediaQuery.of(context).size.width - 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      border: Border.all(color: Colors.black, width: 1),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          blurRadius: 20.0,
                          spreadRadius: 5.0,
                        )
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: "Regular",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        criarTextField(
                            //***********************************EMAIL TABLET
                            "Informe seu email",
                            TextInputType.emailAddress,
                            Icons.email_outlined,
                            _validadorEmail
                                ? "Email nao pode estar em branco"
                                : null,
                            emailController),
                        SizedBox(
                          height: 20,
                        ),
                        criarTextField(
                            //***********************SENHA TABLET
                            "Informe sua Senha",
                            TextInputType.text,
                            Icons.vpn_key_outlined,
                            _validadorSenha
                                ? "Senha nao pode estar em branco"
                                : null,
                            senhaController),
                        Divider(
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          //***************************************botao entrar TABLET
                          width: MediaQuery.of(context).size.width / 1.6,
                          height: 50,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              backgroundColor: Colors.blueAccent,
                              shadowColor: Colors.black,
                              elevation: 5,
                            ),
                            onPressed: () {
                              setState(() {
                                if (emailController.text.isEmpty) {
                                  _validadorEmail = true;
                                } else {
                                  _validadorEmail = false;
                                }
                                if (senhaController.text.isEmpty) {
                                  _validadorSenha = true;
                                } else {
                                  _validadorSenha = false;
                                }
                                if (!emailController.text.isEmpty &&
                                    senhaController.text.isEmpty) {
                                  loginBD();
                                }
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Icon(
                                  Icons.login,
                                  size: 36,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "ENTRAR",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: "Regular",
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          //************************NAO TENHO CADASTRO TABLET

                          width: MediaQuery.of(context).size.width / 2,
                          height: 40,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              backgroundColor: Colors.brown,
                              shadowColor: Colors.black,
                              elevation: 5,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context,
                                  '/cadastrar_usuario'); //chama tela de cadastro de usuario tablet
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.assignment_late_outlined,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Não tenho cadastro",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Regular",
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget criarTextField(
      //************criar dinamicamente um TextBox
      @required String hintTexto,
      @required TextInputType tipoTeclado,
      @required IconData icone,
      @required String erroTexto,
      @required TextEditingController controller) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: Colors.transparent),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 15)]),
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          keyboardType: tipoTeclado,
          controller: controller,
          decoration: InputDecoration(
            errorText: erroTexto,
            hintText: hintTexto,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            icon: Icon(
              icone,
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }

  Future loginBD() async {
    var url = "https://amigoazul.000webhostapp.com/usuarios/login_usuario.php";
    var resposta = await http.post(url, body: {
      "email": emailController.text,
      "senha": senhaController.text,
    });
    var dados = json.decode(resposta.body);
    if (dados["resultado"] == "USUARIO NAO ENCONTRADO!") {
      Fluttertoast.showToast(
          msg: "Dados não localizados",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    } else {
      Fluttertoast.showToast(
          msg: "Login com Sucesso",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.black);
      Future.delayed(Duration(seconds: 2),
          () => Navigator.pushNamed(context, '/splash_screen'));
    }
  }
}
