import 'package:flutter/material.dart';


    class menuDrawer extends StatefulWidget {
      @override
      _menuDrawerState createState() => _menuDrawerState();
    }

    class _menuDrawerState extends State<menuDrawer> {
      @override
      Widget build(BuildContext context) {
        return Container(
          child: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Text("cabeçalho"),
                  decoration: BoxDecoration(color: Colors.blue),
                ),
                ListTile(
                  leading: Icon(Icons.arrow_forward_ios),
                  trailing: Icon(Icons.more_vert),
                  title: Text("Helper V.E.I.A"),
                  onTap: () {
                    Navigator.pop(context); //fecha o Drawer ao clicar em algum item
                  },
                ),
                ListTile(
                    title: Text("Calculo de Porcentagem"),
                    leading: Icon(Icons.arrow_forward_ios),
                    trailing: Icon(Icons.more_vert),
                    onTap: () {
                      Navigator.pop(
                          context); //fecha o Drawer ao clicar em algum item
                    }),
                ListTile(
                  title: Text("Ler Xml Nf-e"),
                  leading: Icon(Icons.arrow_forward_ios),
                  trailing: Icon(Icons.more_vert),
                  onTap: () {
                    Navigator.pop(context); //fecha o Drawer ao clicar em algum item
                  },
                ),
              ],
            ),

        ),
        );


      }
    }
