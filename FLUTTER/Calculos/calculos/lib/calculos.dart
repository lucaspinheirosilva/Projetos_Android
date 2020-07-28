import 'package:calculos/drawer.dart';
import 'package:flutter/material.dart';

class Calculos extends StatefulWidget {
  @override
  _CalculosState createState() => _CalculosState();
}

class _CalculosState extends State<Calculos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TITULO"),
        elevation: 10,
        centerTitle: true,
        shadowColor: Colors.blueAccent,
      ),
      drawer: menuDrawer(),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
