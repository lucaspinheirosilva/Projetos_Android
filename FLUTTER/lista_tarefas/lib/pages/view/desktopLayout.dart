import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:lista_tarefas/model/todo.dart';
import 'package:lista_tarefas/pages/todo_controller.dart';
import 'package:lista_tarefas/repository/todo_repository.dart';

class DeskTopLayout extends StatefulWidget {
  const DeskTopLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<DeskTopLayout> createState() => _DeskTopLayoutState();
}

List<Todo> listTodo = [];
String? errorText = null;
Todo? todoExcluido;
int? posTodoExcluido;
TextEditingController tecAddTarefa = TextEditingController();
Todo_Controller controlle = Todo_Controller(listaTodo: listTodo);
Todo_repository repository = Todo_repository();

class _DeskTopLayoutState extends State<DeskTopLayout> {
  @override
  void initState() {
    super.initState();

    repository.getTodoList().then((value) {
      setState(() {
        listTodo = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: SizedBox(
            width: 1000,
            height: 500,
            child: Card(
              margin: const EdgeInsets.only(left: 100, right: 100),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 13.0),
                          child: Text(
                            "Lista de Tarefas",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                wordSpacing: 2),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: tecAddTarefa,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Add Tarefa",
                                floatingLabelStyle: const TextStyle(
                                    color: Colors.red, fontSize: 20),
                                hintText: "Descreva a Terefa a ser realizada",
                                errorText: errorText),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (tecAddTarefa.text.isEmpty) {
                                errorText = "o titulo nao pode ser vazio!";
                              } else {
                                controlle.onTapAddTarefa(tecAddTarefa);
                                errorText = null;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 5,
                              padding: const EdgeInsets.all(23),
                              primary: Colors.lightGreen[600]),
                          child: const Icon(
                            Icons.add,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Flexible(
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          for (Todo td in listTodo)
                            listTileSlideble(context, td)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Voce tem um total de ${listTodo.length} tarefas",
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                              onPressed: () {
                                showDialogDeleteAllTodo();
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  padding: const EdgeInsets.all(0),
                                  primary: Colors.lightGreen[600]),
                              child: const Text("Apagar Tudo")),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget listTileSlideble(BuildContext context, Todo todo) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.28,
        //dismissible: DismissiblePane(onDismissed: () {}),
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => onTapDelete(todo),
            spacing: 8,
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: BorderRadius.circular(12),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(DateFormat('dd/MM/yyy HH:mm:ss').format(todo.data),
                style: const TextStyle(
                  fontSize: 12,
                )),
            Text(
              todo.titulo,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  void onTapDelete(Todo todo) {
    todoExcluido = todo;
    posTodoExcluido = listTodo.indexOf(todo);
    setState(() {
      listTodo.remove(todo);
    });
    repository.saveTodoList(listTodo);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Tarefa ${todo.titulo} foi removida com sucesso!",
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20)),
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
            label: "Desfazer",
            textColor: Colors.red,
            onPressed: () {
              setState(() {
                controlle.onTapDesfazerExclusao(
                    posTodoExcluido!, todoExcluido!);
              });
            }),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(100),
            topLeft: Radius.circular(100),
          ),
        ),
      ),
    );
  }

  void showDialogDeleteAllTodo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Image.asset(
                    width: 40, height: 40, 'assets/images/warning.png')),
            Expanded(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text("Limpar tudo?", style: TextStyle(fontSize: 25)),
                  ],
                )),
          ],
        ),
        content: const Text("Tem certeza que deseja remover todas as Tarefas?"),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        actions: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(right: 10, left: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13.0),
                              )),
                          onPressed: () {
                            setState(() {
                              controlle.onTapDeleteAll();
                            });
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Limpar Tudo",
                            style: TextStyle(fontSize: 15),
                          ))))
            ],
          )
        ],
      ),
    );
  }
}
