import 'dart:ffi';

import 'package:flutter/material.dart';

class AdaptativeAppBar extends StatelessWidget {
  const AdaptativeAppBar(
      {required this.tituloCategoria, required this.tamanhoFonte, super.key});

  final String tituloCategoria;
  final double tamanhoFonte;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        tituloCategoria,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: tamanhoFonte,
          color: Colors.white,
        ),
        textScaler: const TextScaler.linear(1),
      ),
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      shadowColor: Colors.black,
      foregroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.elliptical(60, 70),
          bottomLeft: Radius.elliptical(60, 70),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
