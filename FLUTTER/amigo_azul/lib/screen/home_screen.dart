import 'package:amigo_azul/scoped_model/usuario_scoped_model.dart';
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
                  builder: (BuildContext context){
                    return GestureDetector(
                      onTap: ()=>Scaffold.of(context).openDrawer(),
                      child: Lottie.asset('assets/icon_drawer.json',
                          repeat: true, animate: true, reverse: true),
                    );
                  } ,
                )
              ),
              drawer: Drawer(child: ListaDrawer(),),
              body: SafeArea(
                child: Container(
                  color: Colors.blue,
                ),
              ))
        ],
      );
    });
  }

  Widget ListaDrawer (){
    return ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("Lucas Pinheiro"),
          accountEmail: Text("lucas@gmail.com"),
          currentAccountPicture: CircleAvatar(
            radius: 30.0,
            backgroundImage:
            NetworkImage(
                'https://developers.google.com/search/images/google-search-central-logo.png?hl=pt-BR'),
            backgroundColor: Colors.transparent,
          ),
        ),
        ListTile(
            leading: Icon(Icons.star),
            title: Text("Favoritos"),
            subtitle: Text("meus favoritos..."),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              debugPrint('toquei no drawer');
            }),
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

  }
}
