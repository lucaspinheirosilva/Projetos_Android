import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:quiz_vetor/models/usuario.dart';
import 'package:quiz_vetor/scopedModel/usuario_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:toast/toast.dart';

class Quiz_Login extends StatefulWidget {
  @override
  _Quiz_LoginState createState() => _Quiz_LoginState();
}

bool _validadorEmail = false;
bool _validadorSenha = false;
bool ocultarSenha = true;

var usuarioAtual;

TextEditingController usuarioController = TextEditingController();
TextEditingController senhaController = TextEditingController();

class _Quiz_LoginState extends State<Quiz_Login> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UsuarioModel>(
        builder: (context, Widget child, UsuarioModel model) {
      return Scaffold(
        //backgroundColor: Colors.blue[100],
        backgroundColor: Colors.black12,
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
                      color: Colors.white,
                      blurRadius: 30.0,
                      spreadRadius: 5.0,
                    )
                  ],
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 450,
                      height: 150,
                      child: Image.asset(
                        "assets/logoVetor.png",
                        fit: BoxFit.fill,
                      ),
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
                  padding: EdgeInsets.all(15.0),
                  width: MediaQuery.of(context).size.width / 2.8,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    border: Border.all(color: Colors.black, width: 1),
                    color: Colors.black26,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
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
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      criarTextField(
                          //***************************************EMAIL CELULAR
                          "Informe seu usuario",
                          TextInputType.emailAddress,
                          Icons.email_outlined,
                          _validadorEmail
                              ? "usuario nao pode estar em branco"
                              : null,
                          usuarioController),
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
                              if (usuarioController.text.isEmpty) {
                                _validadorEmail = true;
                              } else {
                                _validadorEmail = false;
                              }
                              if (senhaController.text.isEmpty) {
                                _validadorSenha = true;
                              } else {
                                _validadorSenha = false;
                              }
                              if (usuarioController.text.isNotEmpty &&
                                  senhaController.text.isNotEmpty) {
                                loginBD(model);
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                    fontSize: 25, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
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

  Future loginBD(UsuarioModel model) async {
    var url =
        "https://amigoazul.000webhostapp.com/QUIZ_VETOR/usuarios/login_usuario.php";
    var resposta = await http.post(url, headers: {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":true, // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    }, body: {
      "usuario": usuarioController.text,
      "senha": senhaController.text,
    });

    var dados;
    if (resposta.body.isNotEmpty){
   dados = json.decode(resposta.body);

   if (dados["resultado"] == "USUARIO NAO ENCONTRADO!") {
     Toast.show("Dados não localizados", context,
         duration: Toast.LENGTH_LONG,
         gravity: Toast.BOTTOM,
         backgroundColor: Colors.red,
         textColor: Colors.white);
   } else {
     Toast.show("Login com Sucesso", context,
         duration: Toast.LENGTH_LONG,
         gravity: Toast.BOTTOM,
         backgroundColor: Colors.green,
         textColor: Colors.white);

     var usuario = dados["resultado"][0]["usuario"];
     var senha = dados["resultado"][0]["senha"];

     usuarioAtual = Usuario(usuario, senha);
     model.login(usuarioAtual);

     Navigator.pushNamed(context, '/quizPage');
   }

    }else{
      print("ERRO AO RETORNAR O JSON DA API!!!!!!!!!!!!!!");
    }


  }
}
