import 'dart:convert';

import 'package:buscador_gifs/widget/campoTexto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class BuscadorDesktop extends StatefulWidget {
  const BuscadorDesktop({Key? key}) : super(key: key);

  @override
  State<BuscadorDesktop> createState() => _BuscadorDesktopState();
}

int offset = 0;
int limit = 24;
String? search;

Future<Map> getGif() async {
  String endPointSearch =
      'https://api.giphy.com/v1/gifs/search?api_key=pu3hKksCJDGBuvS84f9JY2CrAHvRef0c&q=$search&limit=$limit&offset=$offset&rating=g&lang=pt';
  String endPointTrending =
      'https://api.giphy.com/v1/gifs/trending?api_key=pu3hKksCJDGBuvS84f9JY2CrAHvRef0c&limit=$limit&rating=g';

  http.Response response;
  if (search == null || search == "") {
    response = await http.get(Uri.parse(endPointTrending));
  } else {
    response = await http.get(Uri.parse(endPointSearch));
  }
  Map m = json.decode(response.body);
  return m;
}

class _BuscadorDesktopState extends State<BuscadorDesktop> {
  @override
  Widget build(BuildContext context) {
    double larguraTela = MediaQuery.of(context).size.width;
    double alturaTela = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black,
          Colors.black87,
        ],
      )),
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Column(children: [
          Image.asset(
            "assets/logo_titulo.gif",
            fit: BoxFit.fill,
          ),
          Container(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            width: larguraTela / 1.5,
            child: CampoTexto(functionSubmited: (text) {
              setState(() {
                search = text;
              });
            }),
          ),
          Container(
            width: larguraTela / 1.5,
            height: alturaTela / 1.5,
            child: FutureBuilder(
                future: getGif(),
                builder: (context, snapshop) {
                  return switchi(snapshop);
                }),
          ),
        ]),
      ]),
    );
  }

  Widget switchi(AsyncSnapshot snapshop) {
    switch (snapshop.connectionState) {
      case ConnectionState.waiting:
      case ConnectionState.none:
        return SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 3,
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 5,
            ));
      default:
        if (snapshop.hasError) {
          return Container(
            color: Colors.red,
          );
        } else {
          return createGifCard(context, snapshop);
        }
    }
  }

  int getCountCard(List data) {
    if (search == null || search == "") {
      return data.length;
    } else {
      return data.length;
    }
  }

  Widget createGifCard(BuildContext context, AsyncSnapshot snapshop) {
    List listGif = snapshop.data["data"] as List;
    if (listGif.isNotEmpty) {
      return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: getCountCard(snapshop.data["data"]),
        itemBuilder: (BuildContext context, int index) {

          if (search == null || index < snapshop.data["data"].length-1) {
            return GestureDetector(
              child: Image.network(snapshop.data["data"][index]["images"]
                  ["preview_webp"]["url"]),
            );
          } else {
            return GestureDetector(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,children:  [
                Container(
                  width:100 ,
                  height:100,
                  child: Image.asset(
                    "assets/49-plus-circle-outline.gif",
                    fit: BoxFit.fill,
                  ),
                ),
                const Text("Carregar mais...",style: TextStyle(color: Colors.white,fontSize: 22),)
              ]),
            );
          }
        },
      );
    } else {
      return Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Image.asset(
              "assets/alerta.png",
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "Nenhum GIF encontrado para a pesquisa: \"$search\"",
            style: GoogleFonts.cinzel(
                color: Colors.limeAccent,
                fontSize: 25,
                fontWeight: FontWeight.w700),
          )
        ],
      );
    }
  }
}
