import 'package:flutter/material.dart';

class LoginUsuario extends StatefulWidget {
  @override
  _LoginUsuarioState createState() => _LoginUsuarioState();
}

class _LoginUsuarioState extends State<LoginUsuario> {
  bool _validadorTexto = false;

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
                        Container(
                          //-----------------------------> E-MAIL
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              border: Border.all(color: Colors.transparent),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black54, blurRadius: 15)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration: InputDecoration(
                                errorText: _validadorTexto
                                    ? "E-mail nao pode estar em branco"
                                    : null,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              border: Border.all(color: Colors.transparent),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black54, blurRadius: 15)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              controller: senhaController,
                              decoration: InputDecoration(
                                errorText: _validadorTexto
                                    ? "Senha nao pode estar em branco"
                                    : null,
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
                        SizedBox(
                          height: 30,
                        ),
                        Container(
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
                                emailController.text.isEmpty
                                    ? _validadorTexto = true
                                    : _validadorTexto = false;
                                senhaController.text.isEmpty
                                    ? _validadorTexto = true
                                    : _validadorTexto = false;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Icon(
                                  Icons.save_outlined,
                                  size: 36,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "GRAVAR",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: "Regular",
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),

                        ),
                        Container(//*************NAO TENHO CADASTRO
                          child: Row(
                            children: <Widget>[
                              Text("NÃO TENHO CADASTRO")
                            ],
                          ),
                        )
                      ],
                    ),),
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
                        Container(
                          //-----------------------------> E-MAIL
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              border: Border.all(color: Colors.transparent),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black54, blurRadius: 15)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration: InputDecoration(
                                errorText: _validadorTexto
                                    ? "E-mail nao pode estar em branco"
                                    : null,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              border: Border.all(color: Colors.transparent),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black54, blurRadius: 15)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              controller: senhaController,
                              decoration: InputDecoration(
                                errorText: _validadorTexto
                                    ? "Senha nao pode estar em branco"
                                    : null,
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
                        SizedBox(
                          height: 30,
                        ),
                        Container(
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
                                emailController.text.isEmpty
                                    ? _validadorTexto = true
                                    : _validadorTexto = false;
                                senhaController.text.isEmpty
                                    ? _validadorTexto = true
                                    : _validadorTexto = false;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Icon(
                                  Icons.save_outlined,
                                  size: 36,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "GRAVAR",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: "Regular",
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
