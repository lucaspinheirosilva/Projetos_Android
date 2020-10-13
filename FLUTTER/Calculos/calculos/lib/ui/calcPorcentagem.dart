import 'package:flutter/material.dart';

class porcentagem extends StatefulWidget {
  @override
  _porcentagemState createState() => _porcentagemState();
}

class _porcentagemState extends State<porcentagem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      color: Colors.black12,
      child: Column(
       children: <Widget>[
         Row(
           children: <Widget>[
             Text("Quanto é "),
             TextField(),
             Text("%"),
             TextField(),
             Text("?"),
           ],
         )
       ],
      ) ,
    );
  }
}


