import 'dart:io';

import 'package:agendacontato/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  final Contact contact;

  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Contact _editeContact;
  bool _userEdited = false;
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(_editeContact.nome ?? "Novo Contato"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
            ),
            TextField(
              controller: _nomeController,
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
              keyboardType:  TextInputType.emailAddress,
            ),
            TextField(
              controller: _telefoneController,
              decoration: InputDecoration(labelText: "Telefone"),
              onChanged: (text) {
                _userEdited = true;
                _editeContact.fone = text;
              },
              keyboardType:  TextInputType.phone,
            ),
          ],
        ),
      ),
    );
  }
}
