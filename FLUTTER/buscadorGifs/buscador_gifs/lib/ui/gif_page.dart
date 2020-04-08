import 'package:flutter/material.dart';

class GifPage extends StatelessWidget {
  Map _gifData;

  GifPage(this._gifData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _gifData["title"],
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        iconTheme: IconThemeData(
          color: Colors.amberAccent,
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {

          })
        ],
      ),
      backgroundColor: Colors.black87,
      body: Center(
        child: Image.network(_gifData["images"]["fixed_height"]["url"]),
      ),
    );
  }
}
