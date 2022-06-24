import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuscadorDesktop extends StatefulWidget {
  const BuscadorDesktop({Key? key}) : super(key: key);

  @override
  State<BuscadorDesktop> createState() => _BuscadorDesktopState();
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
            width: larguraTela / 2,
            height: alturaTela / 10,
            fit: BoxFit.fill,
          ),
          Container(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            width: larguraTela / 1.5,
            child: campoText(),
          )
        ]),
      ]),
    );
  }

  Widget campoText() {
    return TextField(

      textAlign: TextAlign.start,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.red,
      decoration: InputDecoration(
      floatingLabelStyle:GoogleFonts.shortStack( fontSize: 30,fontWeight: FontWeight.w700,color: Colors.white,),
        contentPadding: EdgeInsets.all(15),
        labelText: "Pesquisa",
        floatingLabelAlignment: FloatingLabelAlignment.center,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: GoogleFonts.laBelleAurore(
          fontSize: 25,
          color: Colors.white,
        ),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff4F4F4F)),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            borderSide: BorderSide(color: Colors.amberAccent)),
        fillColor: Color(0xff100F12),
        filled: true,
      ),
    );
  }
}
