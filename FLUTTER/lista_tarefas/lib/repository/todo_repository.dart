import 'dart:convert';

import 'package:lista_tarefas/model/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

const todoListkey = "todo_List";

class Todo_repository {
  Future<SharedPreferences> shared = SharedPreferences.getInstance();

  Future<List<Todo>> getTodoList() async {
    final SharedPreferences prefs = await shared;
    final String jsonString = prefs.getString(todoListkey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Todo.fromJson(e)).toList();
  }

  void saveTodoList(List<Todo> todos) async {
    final SharedPreferences prefs = await shared;
    prefs.setString(todoListkey, jsonEncode(todos));
  }
}
