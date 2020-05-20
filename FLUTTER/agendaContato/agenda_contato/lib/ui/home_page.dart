import 'dart:io';
import 'package:agendacontato/helpers/contact_helper.dart';
import 'package:agendacontato/ui/contact_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum OrderOptions { orderAZ, orderZA }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();
  List<Contact> contacts = List();

  @override
  void initState() {
    super.initState();
    _getAllContacts();
    helper.getAllContacts().then((list) {
      print(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<OrderOptions>(
              itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
                    const PopupMenuItem<OrderOptions>(
                      child: Text("Ordenas de A-Z"),
                      value: OrderOptions.orderAZ,
                    ),
                    const PopupMenuItem<OrderOptions>(
                      child: Text("Ordenas de Z-A"),
                      value: OrderOptions.orderZA,
                    ),
                  ],
              onSelected: _orderList)
        ],
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showContactPage();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return _contactCard(context, index);
          }),
    );
  }

  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: contacts[index].img != null
                            ? FileImage(File(contacts[index].img))
                            : AssetImage("images/person.png"))),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      contacts[index].nome ?? "",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      contacts[index].email ?? "",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      contacts[index].fone ?? "",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        _showOptions(context, index);
      },
    );
  }

  void _showOptions(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              builder: (context) {
                return Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: FlatButton(
                            onPressed: () {
                              launch("tel:${contacts[index].fone}");
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.phone)
                            /*Text(
                              "Ligar",
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            )*/
                            ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _showContactPage(contact: contacts[index]);
                            },
                            child: Icon(Icons.border_color)
                            /*Text(
                            "Editar",
                            style: TextStyle(color: Colors.red, fontSize: 20),
                            )*/
                            ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: FlatButton(
                            onPressed: () {
                              setState(() {
                                helper.deleteContact(contacts[index].id);
                                contacts.removeAt(index);
                                Navigator.pop(context);
                              });
                            },
                            child: Icon(Icons
                                .delete) /*Text(
                              "Excluir",
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            )*/
                            ),
                      ),
                    ],
                  ),
                );
              });
        });
  }

  void _showContactPage({Contact contact}) async {
    final recContact = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ContactPage(
                  contact: contact,
                )));
    if (recContact != null) {
      if (contact != null) {
        await helper.updateContact(recContact);
        _getAllContacts();
      } else {
        await helper.saveContact(recContact);
      }
      _getAllContacts();
    }
  }

  void _getAllContacts() {
    helper.getAllContacts().then((list) {
      setState(() {
        contacts = list;
      });
    });
  }

  void _orderList(OrderOptions result) {
    switch (result) {
      case OrderOptions.orderAZ:
        contacts.sort((a, b) {
          return a.nome.toLowerCase().compareTo(b.nome.toLowerCase());
        });
        break;
      case OrderOptions.orderZA:
        contacts.sort((a, b) {
          return b.nome.toLowerCase().compareTo(a.nome.toLowerCase());
        });
        break;
    }
    setState(() {});
  }
}
