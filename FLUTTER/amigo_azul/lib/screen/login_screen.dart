import 'dart:convert';

import 'package:amigo_azul/model/usuario.dart';
import 'package:amigo_azul/scoped_model/usuario_scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class LoginUsuario extends StatefulWidget {
  @override
  _LoginUsuarioState createState() => _LoginUsuarioState();
}

class _LoginUsuarioState extends State<LoginUsuario> {
  bool _validadorEmail = false;
  bool _validadorSenha = false;
  bool ocultarSenha = true;

  var usuarioAtual;

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //----->SETA PARA A TELA DO APP NA GIRAR
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    emailController.text = "elaine@gmail";
    senhaController.text = "123";
    /*emailController.text = "lucas@gmail";
    senhaController.text = "123";*/

    return ScopedModelDescendant<UsuarioModel>(
        builder: (context, Widget child, UsuarioModel model) {
      return Scaffold(
        backgroundColor: Colors.blue[100],
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                //******************************************cabeçalho com a logo
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
                  //**************************************************caixa LOGIN
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
                        //**********************************************titulo LOGIN
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
                          //***************************************EMAIL CELULAR
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
                      Container(
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
                            obscureText: ocultarSenha,
                            keyboardType: TextInputType.text,
                            controller: senhaController,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    ocultarSenha = !ocultarSenha;
                                  });
                                },
                                icon: Icon(ocultarSenha
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                              ),
                              errorText: _validadorSenha
                                  ? "Senha é obrigatório"
                                  : null,
                              hintText: "Informe sua Senha",
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
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        //*******************************************botao entrar CELULAR
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
                              if (emailController.text.isNotEmpty &&
                                  senhaController.text.isNotEmpty) {
                                loginBD(model);
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
                        //******************************************NAO TENHO CADASTRO

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
                            Navigator.pushNamed(
                                context, '/intro_screen'); //chama tela de INTRO
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
      );
    });
  }

  Widget criarTextField(
      //*************************************************************CRIAR DINAMICAMENTE O TEXTFIELD
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

//TODO==>Futuramente implementar um forma para ficar dinamico esse login
//TODO==>Implementar para ver quando nao tiver internet ou nao conseguir conexão
//TODO==>Colocar um CircularProgressIndicator para mostrar que esta aguardando

  Future<Map> loginBD(UsuarioModel model) async {
    var url = "https://amigoazul.000webhostapp.com/AMIGO%20AZUL/usuarios/login_usuario.php";
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
      var email = dados["resultado"][0]["email"];
      var nome = dados["resultado"][0]["nome"];
      var idade = dados["resultado"][0]["idade"];
      var senha = dados["resultado"][0]["senha"];
      var foto = dados["resultado"][0]["foto"];
      var grauTea = dados["resultado"][0]["nivel_tea"];

      usuarioAtual = Usuario(email, senha, nome, foto, idade, grauTea);
      model.login(usuarioAtual);
      Navigator.pushNamed(context, '/splash_screen');
    }
  }
}
