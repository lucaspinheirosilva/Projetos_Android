import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _pesquisa;
  int _offSet = 0;

  Future<Map> _pegarGifs() async {
    http.Response response;
    if (_pesquisa == null) {
      response = await http.get(
          "https://api.giphy.com/v1/gifs/trending?api_key=pu3hKksCJDGBuvS84f9JY2CrAHvRef0c&limit=30&rating=G");
    } else {
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=pu3hKksCJDGBuvS84f9JY2CrAHvRef0c&q=$_pesquisa&limit=29&offset=$_offSet&rating=G&lang=pt");
    }
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Image.network(
            "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black87,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.00),
            child: TextField(
              decoration: InputDecoration(
                  labelText: " Pesquise Aqui ",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)))),
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
              onSubmitted: (texto) {
                setState(() {
                  _pesquisa = texto;
                  _offSet=0;
                });
              },
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: _pegarGifs(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return Container(
                          width: 800.0,
                          height: 800.0,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                            strokeWidth: 5.0,
                          ),
                        );
                      default:
                        if (snapshot.hasError) {
                          return Container(
                            child: Icon(
                              Icons.error_outline,
                              size: 150,
                              color: Colors.red,
                            ),
                          );
                        } else {
                          return _CriarTabelaGifd(context, snapshot);
                        }
                    }
                  }))
        ],
      ),
    );
  }

  int _pegarContador(List dados) {
    if (_pesquisa == null) {
      return dados.length;
    } else {
      return dados.length + 1;
    }
  }

  Widget _CriarTabelaGifd(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _pegarContador(snapshot.data["data"]),
        itemBuilder: (context, index) {
          if (_pesquisa == null || index < snapshot.data["data"].length) {
            return GestureDetector(
              child: Image.network(
                  snapshot.data["data"][index]["images"]["fixed_height"]["url"],
                  height: 300,
                  fit: BoxFit.fill),
            );
          } else {
            return Container(
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 70,
                    ),
                    Text(
                      "Carregar mais...",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    )
                  ],
                ),
                onTap: (){
                  setState(() {
                    _offSet=_offSet+19;

                  });
                },
              ),
            );
          }
        });
  }
}
