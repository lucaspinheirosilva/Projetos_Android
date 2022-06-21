import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  TextEditingController? tec;
  String? caminhoImagem;
  String? hinText;
  String? label;
  String? errorText;

  CampoTexto(
      {required this.tec,
      required this.label,
      required this.hinText,
      required this.caminhoImagem,
      this.errorText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
          boxShadow: [sombra()!]),
      child: TextField(
        keyboardType:TextInputType.number ,
        controller: tec,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          errorText: errorText,
          hintStyle: const TextStyle(color: Colors.green),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius:
                const BorderRadius.only(topRight: Radius.circular(30)),
            borderSide:
                BorderSide(color: Colors.red.withOpacity(0.5), width: 2),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 5, right: 10),
            child: Image.asset(
              caminhoImagem!,
              width: 30,
              height: 25,
            ),
          ),
          hintText: hinText,
          label: Text(label!, style: const TextStyle(color: Colors.green)),
          labelStyle: const TextStyle(fontSize: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius:
                const BorderRadius.only(topRight: Radius.circular(30)),
            borderSide:
                BorderSide(color: Colors.green.withOpacity(0.6), width: 2),
          ),
        ),
      ),
    );
  }

  BoxShadow? sombra() {
    if (errorText == null) {
      return BoxShadow(
        color: Colors.black12.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 1,
        offset: const Offset(3, 3), // changes position of shadow
      );
    } else {
      return const BoxShadow(
        color: Colors.white,
        spreadRadius: 2,
        blurRadius: 1,
        offset: Offset(3, 3), // changes position of shadow
      );
    }
  }
}
