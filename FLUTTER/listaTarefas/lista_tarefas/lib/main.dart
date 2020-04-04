import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _toDoController = TextEditingController();
  List _toDoList = [];
  Map<String, dynamic> _ultimoRemovido;
  int _ultimaPosicRemovido;

  @override
  void initState() {
    super.initState();
    _LerDados().then((data) {
      setState(() {
        _toDoList = json.decode(data);
      });
    });
  }

  void _addToDo() {
    setState(() {
      if (_toDoController.text == "") {
        //não faz nada
      } else {
        Map<String, dynamic> newToDo = Map();
        newToDo["title"] = _toDoController.text;
        newToDo["ok"] = false;
        _toDoList.add(newToDo);
        _toDoController.text = "";
        SalvarDados();
      }
    });
  }

  Future<Null> _refresh() async {
    await Future.delayed(Duration(milliseconds: 8));
    setState(() {
      _toDoList.sort((a, b) {
        if (a["ok"] && !b["ok"]) {
          return 1;
        } else if (!a["ok"] && b["ok"]) {
          return -1;
        } else {
          return 0;
        }
      });
      SalvarDados();
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(17, 1, 7, 1),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  labelText: "Nova Tarefa",
                  labelStyle: TextStyle(color: Colors.blueAccent),
                ),
                controller: _toDoController,
              )),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text("ADD"),
                textColor: Colors.white,
                onPressed: _addToDo,
              )
            ],
          ),
        ),
        Expanded(
            child: (RefreshIndicator(
                onRefresh: _refresh,
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    itemCount: _toDoList.length,
                    itemBuilder: buildItem))))
      ]),
    );
  }

  Widget buildItem(context, index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete_sweep,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text(_toDoList[index]["title"]),
        value: _toDoList[index]["ok"],
        secondary: CircleAvatar(
            child: Icon(
          _toDoList[index]["ok"] ? Icons.check : Icons.error,
        )),
        onChanged: (check) {
          setState(() {
            _toDoList[index]["ok"] = check;
            SalvarDados();
          });
        },
      ),
      onDismissed: (direcao) {
        setState(() {
          _ultimoRemovido = Map.from(_toDoList[index]);
          _ultimaPosicRemovido = index;
          _toDoList.removeAt(index);
          SalvarDados();

          SnackBar snack = SnackBar(
            content: Text("Tarefa \"${_ultimoRemovido["title"]}\"Removida"),
            action: SnackBarAction(
                label: "Desfazer",
                onPressed: () {
                  setState(() {
                    _toDoList.insert(_ultimaPosicRemovido, _ultimoRemovido);
                    SalvarDados();
                  });
                }),
            duration: Duration(seconds: 4),
          );
          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(snack);
        });
      },
    );
  }

  Future<File> _pegarArquivo() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/tarefas.json");
  }

  Future<File> SalvarDados() async {
    String dado = json.encode(_toDoList);

    final file = await _pegarArquivo();
    return file.writeAsString(dado);
  }

  Future<String> _LerDados() async {
    try {
      final file = await _pegarArquivo();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
