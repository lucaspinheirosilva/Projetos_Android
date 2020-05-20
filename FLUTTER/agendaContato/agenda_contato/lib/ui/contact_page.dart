import 'dart:io';

import 'package:agendacontato/helpers/contact_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactPage extends StatefulWidget {
  final Contact contact;

  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Contact _editeContact;
  bool _userEdited = false;
  final _nomeFocus = FocusNode();

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.contact == null) {
      _editeContact = Contact();
    } else {
      _editeContact = Contact.fromMap(widget.contact.toMap());
      _nomeController.text = _editeContact.nome;
      _emailController.text = _editeContact.email;
      _telefoneController.text = _editeContact.fone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _requestPop();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(_editeContact.nome ?? "Novo Contato"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_editeContact.nome != null && _editeContact.nome.isNotEmpty) {
              Navigator.pop(context, _editeContact);
            } else {
              FocusScope.of(context).requestFocus(_nomeFocus);
            }
          },
          child: Icon(Icons.save),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 140.0,
                  height: 140.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: _editeContact.img != null
                              ? FileImage(File(_editeContact.img))
                              : AssetImage("images/person.png"))),
                ),
                onTap: () {
                  _showOptionsCamera();


                },
              ),
              TextField(
                controller: _nomeController,
                focusNode: _nomeFocus,
                decoration: InputDecoration(labelText: "Nome"),
                onChanged: (texto) {
                  _userEdited = true;
                  setState(() {
                    _editeContact.nome = texto;
                  });
                },
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "E-mail"),
                onChanged: (texto) {
                  _userEdited = true;
                  _editeContact.email = texto;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: _telefoneController,
                decoration: InputDecoration(labelText: "Telefone"),
                onChanged: (text) {
                  _userEdited = true;
                  _editeContact.fone = text;
                },
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Descartar Alterações?"),
              content: Text(
                  "Se sair as alterações serão perdidas! Deseja sair realmente? "),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar")),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text("SIM"),
                )
              ],
            );
          });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  void _showOptionsCamera() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              builder: (context) {
                return Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(30),
                          topRight: const Radius.circular(30))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: FlatButton(
                            onPressed: () {
                              ImagePicker.pickImage(source: ImageSource.camera)
                                  .then((file) {
                                if (file == null) {
                                  return;
                                } else {
                                  setState(() {
                                    _editeContact.img = file.path;
                                  });
                                }
                                Navigator.pop(context);
                              });
                            }, child: Icon(Icons.linked_camera)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: FlatButton(
                            onPressed: () {
                              ImagePicker.pickImage(source: ImageSource.gallery)
                                  .then((file) {
                                if (file == null) {
                                  return;
                                } else {
                                  setState(() {
                                    _editeContact.img = file.path;
                                  });
                                }
                                Navigator.pop(context);
                              });
                            }, child: Icon(Icons.add_photo_alternate)),
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
