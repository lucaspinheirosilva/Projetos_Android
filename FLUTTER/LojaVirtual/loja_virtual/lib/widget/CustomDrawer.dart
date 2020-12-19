import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/tiles/DrawerTile.dart';

class CustomDrawer extends StatelessWidget {

final PageController pageController;


CustomDrawer(this.pageController);


  int i = 0;
  @override
  Widget build(BuildContext context) {
    Widget _bildDraweBach() {
      return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 203, 236, 241), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      );
    }

    return Drawer(
      child: Stack(
        children: <Widget>[
          _bildDraweBach(),
          ListView(
            padding: EdgeInsets.only(left: 32, top: 16),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.fromLTRB(0, 16, 16, 8),
                height: 170,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8,
                      left: 0,
                      child: Text(
                        "FLutter's\nClotting",
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Olá,",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            child: Text(
                              "Entre ou Cadastre-se",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),

                            onTap: () {
                              i=i+1;
                                print("CLICOU EM CADASTRE-SE $i vezes");
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTiles(Icons.home,"Inicio",pageController,0),
              DrawerTiles(Icons.list,"Produtos",pageController,1),
              DrawerTiles(Icons.location_on,"Lojas",pageController,2),
              DrawerTiles(Icons.playlist_add_check,"Meus Pedidos",pageController,3),
            ],
          )
        ],
      ),
    );
  }
}
