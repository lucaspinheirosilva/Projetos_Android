import 'dart:convert';
import 'dart:io';
import 'package:amigo_azul/model/usuario.dart';
import 'package:amigo_azul/scoped_model/usuario_scoped_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:scoped_model/scoped_model.dart';

class CadastroUsuario extends StatefulWidget {
  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  int _radioValue = 0;
  bool _validadorNome = false;
  bool _validadorIdade = false;
  bool _validadorEmail = false;
  bool _validadorSenha = false;
  bool mostrarSenha = true;

  String grauTea;
  String foto;

  final picker = ImagePicker();
  File _selectedImage;

  var espacoEntreCampos = 10.0;

  var usuarioAtual;

  String linkUrl = "";

  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]); //----->SETA PARA A TELA DO APP NA GIRAR

    /*nomeController.text = "lu";
    idadeController.text = "22";
    emailController.text = "lu@lu";
    senhaController.text = "123";*/

    return ScopedModelDescendant<UsuarioModel>(
        builder: (BuildContext context, Widget child, UsuarioModel model) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height / 4),
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
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  )),
                ),
                SizedBox(
                  height: espacoEntreCampos,
                ),
                Column(
                  children: <Widget>[
                    //----------------------------->FOTO
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          _showPicker(context);
                        },
                        child: CircleAvatar(
                          radius: 54,
                          backgroundColor: Colors.blueAccent,
                          child: _selectedImage != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.file(
                                    _selectedImage,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fitHeight,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(50)),
                                  width: 100,
                                  height: 100,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: espacoEntreCampos,
                    ),

                    //-----------------------------> NOME CELULAR
                    criarTextField(
                      erroTexto: _validadorNome ? "Nome é obrigatório" : null,
                      controller: nomeController,
                      hintTexto: "Informe seu nome",
                      icone: Icons.account_box_outlined,
                      tipoTeclado: TextInputType.text,
                    ),

                    SizedBox(
                      height: espacoEntreCampos,
                    ),
                    //--------------------------------> IDADE CELULAR
                    criarTextField(
                      erroTexto: _validadorIdade ? "Idade é obrigatório" : null,
                      controller: idadeController,
                      hintTexto: "Informe sua Idade",
                      icone: Icons.adjust_outlined,
                      tipoTeclado: TextInputType.number,
                    ),

                    SizedBox(
                      height: espacoEntreCampos,
                    ),

                    //-----------------------------> E-MAIL CELULAR
                    criarTextField(
                      hintTexto: "Informe seu E-mail",
                      tipoTeclado: TextInputType.emailAddress,
                      icone: Icons.email_outlined,
                      erroTexto:
                          _validadorEmail ? "E-mail é obrigatório" : null,
                      controller: emailController,
                    ),

                    SizedBox(
                      height: espacoEntreCampos,
                    ),
                    //-----------------------------> SENHA CELULAR
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
                          obscureText: mostrarSenha,
                          keyboardType: TextInputType.text,
                          controller: senhaController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  mostrarSenha = !mostrarSenha;
                                });
                              },
                              icon: Icon(mostrarSenha
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined),
                            ),
                            errorText:
                                _validadorSenha ? "Senha é obrigatório" : null,
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

                    SizedBox(
                      height: espacoEntreCampos,
                    ),
                    Container(
                      //--------------------------------GRAU TEA CELULAR
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
                      height: espacoEntreCampos,
                    ),
                    Container(
                      //*******************************************botao GRAVAR CELULAR
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
                        //TODO => Colocar uma CircularProgressIndicator para informar que esta carregando
                        onPressed: () async {
                          await downloadURL();
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
                            if (nomeController.text.isEmpty) {
                              _validadorNome = true;
                            } else {
                              _validadorNome = false;
                            }
                            if (idadeController.text.isEmpty) {
                              _validadorIdade = true;
                            } else {
                              _validadorIdade = false;
                            }
                            if (emailController.text.isNotEmpty &&
                                senhaController.text.isNotEmpty &&
                                idadeController.text.isNotEmpty &&
                                nomeController.text.isNotEmpty) {
                              if (foto == null) {
                                //se o campo foto for em branco, sera enviado ao DB a sigla N/A
                                foto = "N/A";
                              }
                              if (grauTea == null) {
                                //se o campo grau tea for em branco, sera enviado ao DB a sigla N/A
                                grauTea = "N/A";
                              }
                              //TODO=> tratar se o usuario tem acesso a internet no dispositivo
                              usuarioAtual = Usuario(
                                  emailController.text,
                                  senhaController.text,
                                  nomeController.text,
                                  linkUrl,
                                  grauTea,
                                  idadeController.text);

                              cadastrar(usuarioAtual, model);
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
                              width: espacoEntreCampos,
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
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }



  void _escolhaRadioButton(int valor) {
    setState(() {
      _radioValue = valor;

      switch (_radioValue) {
        case 1:
          print("ESCOLHEU 1");
          grauTea = "1";
          break;
        case 2:
          print("ESCOLHEU 2");
          grauTea = "2";
          break;
        case 3:
          print("ESCOLHEU 3");
          grauTea = "3";
          break;
      }
    });
  }

  //envia a foto para o Firebase Storage  e recupera o Link de Download da imagem
  Future<String> downloadURL() async {
    StorageReference reference = FirebaseStorage.instance
        .ref()
        .child('usuariosFotos')
        .child(emailController.text)
        .child(nomeController.text);

    var upload = reference.putFile(_selectedImage);
    await upload.onComplete;

    var url = await reference.getDownloadURL();
    print(url.toString());
    linkUrl = url.toString();
    return linkUrl;
  }

  //criar dinamicamente um TextBox
  Widget criarTextField({
    String hintTexto,
    TextInputType tipoTeclado,
    IconData icone,
    String erroTexto,
    TextEditingController controller,
  }) {
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

//TODO==>Futuramente implementar um forma para ficar dinamico esse cadastro
  void cadastrar(Usuario usuario, UsuarioModel model) async {
    var url = "https://amigoazul.000webhostapp.com/usuarios/gravarUsuario.php";
    var resposta = await http.post(url, body: {
      "nome": usuario.nome,
      "email": usuario.email,
      "senha": usuario.senha,
      "idade": usuarioAtual.idade,
      "foto": usuarioAtual.foto,
      "nivelTea": usuarioAtual.grauTea,
    });
    var dados = json.decode(resposta.body);

    if (dados["resultado"] == "ja existe") {
      Fluttertoast.showToast(
          msg: "Ja existe uma conta com esse E-MAIL",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    } else {
      Fluttertoast.showToast(
          msg: "Cadastro realizado com sucesso",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.black);

      usuarioAtual = usuario;
      model.login(usuarioAtual);

      Future.delayed(Duration(seconds: 2),
          () => Navigator.pushNamed(context, '/splash_screen'));
    }
  }

//Dialog para escolher entre camera ou galeria
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Escolha",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Regular",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  new Divider(),
                  new ListTile(
                      leading: Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () => Scaffold.of(context).openDrawer(),
                            child: Lottie.asset('assets/icon_galeria.json',
                                repeat: true, animate: true, reverse: true),
                          );
                        },
                      ),
                      title: new Text(
                        'Foto Galeria',
                        style: TextStyle(
                          fontFamily: "Regular",
                        ),
                      ),
                      onTap: () {
                        getImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () => Scaffold.of(context).openDrawer(),
                          child: Lottie.asset('assets/icon_camera.json',
                              repeat: true, animate: true, reverse: false),
                        );
                      },
                    ),
                    title: new Text(
                      'Camera',
                      style: TextStyle(
                        fontFamily: "Regular",
                      ),
                    ),
                    onTap: () {
                      getImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

// rotina para tirar a foto ou galeria
  Future getImage(ImageSource src) async {
    final pickedFile = await picker.getImage(
        source: src, maxWidth: 1000, maxHeight: 1000, imageQuality: 100);

    if (pickedFile != null) {
      File cropped = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        cropStyle: CropStyle.circle,
        maxHeight: 1000,
        maxWidth: 1000,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Camera',
        ),
        iosUiSettings: IOSUiSettings(
          title: 'Camera',
        ),
      );
      setState(() {
        _selectedImage = cropped;
      });
    } else {
      print('Sem imagem selecionada!.');
    }
  }
}
