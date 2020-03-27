import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _people = 0;
  String _infoText = "Pode entrar!";

  void _ChangePeople(int valor) {
    setState(() {
      _people += valor;
      if (_people < 0) {
        _infoText = "Mundo Invertido!!??";
      }
      else if (_people >10) {
        _infoText = "Lugar LOTADO!!";
      }
      else{
        _infoText = "Pode entrar!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/fundo.jpg", fit: BoxFit.cover, height: 1000),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoa: $_people",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                      child: Text(
                        "+1",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      onPressed: () {
                        _ChangePeople(1);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                      child: Text(
                        "-1",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      onPressed: () {
                        _ChangePeople(-1);
                      }),
                ),
              ],
            ),
            Text(_infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30))
          ],
        )
      ],
    );
  }
}
