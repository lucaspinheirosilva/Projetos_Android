import 'package:flutter/material.dart';
import 'package:lista_tarefas/repository/todo_repository.dart';
import '../model/todo.dart';

class Todo_Controller {
  Todo_Controller({
    Key? key,
    this.todo,
    required this.listaTodo,
  });

  final todo;
  final List<Todo> listaTodo;
  Todo_repository repo = Todo_repository();

  onTapAddTarefa(TextEditingController tecAddTarefa) {
    Todo ntodo = Todo(titulo: tecAddTarefa.text, data: DateTime.now());
    listaTodo.add(ntodo);
    tecAddTarefa.clear();
    repo.saveTodoList(listaTodo);
  }

  onTapDeleteAll() {
    listaTodo.clear();
    repo.saveTodoList(listaTodo);
  }

  onTapDesfazerExclusao(int posTodoExcluido, Todo todoExcluido) {
    listaTodo.insert(posTodoExcluido, todoExcluido);
    repo.saveTodoList(listaTodo);
  }
}
