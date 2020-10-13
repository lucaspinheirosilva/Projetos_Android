import 'package:calculos/ui/calcPorcentagem.dart';
import 'package:calculos/ui/helpVeia.dart';
import 'package:flutter/material.dart';

import 'ui/leitorXML.dart';

class Calculos extends StatefulWidget {
  @override
  _CalculosState createState() => _CalculosState();
}

class _CalculosState extends State<Calculos> {
  int _index = 0;

  Widget _mudarBody() {
    switch (_index) {
      case 1:
        return helpVEIA();
      case 2:
        return porcentagem() ;
      case 3:
        return leitorNFE();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TITULO"),
          elevation: 10,
          centerTitle: true,
          shadowColor: Colors.blueAccent,
        ),
        drawer: Drawer(
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
                  setState(() {
                    _index = 1;
                  });
                  Navigator.pop(
                      context); //fecha o Drawer ao clicar em algum item
                },
              ),
              ListTile(
                  title: Text("Calculo de Porcentagem"),
                  leading: Icon(Icons.arrow_forward_ios),
                  trailing: Icon(Icons.more_vert),
                  onTap: () {
                    setState(() {
                      _index = 2;
                    });
                    Navigator.pop(
                        context); //fecha o Drawer ao clicar em algum item
                  }),
              ListTile(
                title: Text("Ler Xml Nf-e"),
                leading: Icon(Icons.arrow_forward_ios),
                trailing: Icon(Icons.more_vert),
                onTap: () {
                  setState(() {
                    _index = 3;
                  });

                  Navigator.pop(
                      context); //fecha o Drawer ao clicar em algum item
                },
              ),
            ],
          ),
        ),
        body: _mudarBody());
  }
}
