import 'package:amigo_azul/scoped_model/usuario_scoped_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //----->SETA PARA A TELA DO APP NA GIRAR
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScopedModelDescendant<UsuarioModel>(
        builder: (BuildContext context, Widget child, UsuarioModel model) {
      return Stack(
        children: <Widget>[
          Scaffold(
              appBar: AppBar(
                  title: Text(""),
                  backgroundColor: Colors.blue,
                  elevation: 0,
                  leading: Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: Lottie.asset('assets/icon_drawer.json',
                            repeat: true, animate: true, reverse: true),
                      );
                    },
                  )),
              drawer: Drawer(
                child: ListaDrawer(),
              ),
              body: SafeArea(
                child: Container(
                  color: Colors.blue,
                ),
              ))
        ],
      );
    });
  }

  //TODO==> ARRENDONDAR FOTO DE USUARIO, ESTÁ QUADRADO
  ValidarFoto(UsuarioModel model) {
    if (model.usuarioAtual.foto != "N/A") {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: FadeInImage.assetNetwork(
          image: model.usuarioAtual.foto,
          placeholder: 'assets/loading.gif',
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: FadeInImage.assetNetwork(
            image:
                "https://cdn.icon-icons.com/icons2/67/PNG/512/user_13230.png",
            placeholder: 'assets/loading.gif'),
      );
    }
  }

  //-------DRAWER
  Widget ListaDrawer() {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, UsuarioModel model) {
      return ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text(
                '${model.usuarioAtual.nome[0].toUpperCase()}${model.usuarioAtual.nome.substring(1)}',
              ),
              accountEmail: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text('SAIR'),
                  )
                ],
              ),
              currentAccountPicture: ValidarFoto(model)),
          ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Perfil"),
              subtitle: Text("Perfil do usuário..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
              })
        ],
      );
    });
  }
}
