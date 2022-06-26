import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CampoTexto extends StatelessWidget {
  Function functionSubmited;

  CampoTexto({Key? key, required this.functionSubmited}) : super(key: key);

  @override
  Widget build(BuildContext context) {    return TextField(

      onSubmitted: (text) {
        functionSubmited(text);
      },
      textAlign: TextAlign.center,
      style:const TextStyle(color: Colors.white),
      cursorColor: Colors.red,
      decoration: InputDecoration(
        floatingLabelStyle: GoogleFonts.shortStack(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        contentPadding: const EdgeInsets.all(15),
        labelText: "Pesquisa",
        floatingLabelAlignment: FloatingLabelAlignment.center,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: GoogleFonts.laBelleAurore(
          fontSize: 25,
          color: Colors.white,
        ),
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff4F4F4F)),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            borderSide: BorderSide(color: Colors.amberAccent)),
        fillColor: const Color(0xff100F12),
        filled: true,
      ),
    );
  }
}
