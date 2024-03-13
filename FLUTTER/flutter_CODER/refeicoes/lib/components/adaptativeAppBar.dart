import 'package:flutter/material.dart';

class AdaptativeAppBar extends StatelessWidget {
  const AdaptativeAppBar(this.tituloCategoria, {super.key});

  final String tituloCategoria;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:
          Text(tituloCategoria, style: Theme.of(context).textTheme.titleSmall),
      centerTitle: true,
      elevation: 2,
      iconTheme: const IconThemeData(color: Colors.white),
      shadowColor: Colors.black,
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
