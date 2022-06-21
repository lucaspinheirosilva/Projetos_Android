import 'package:flutter/foundation.dart';

class Todo {
  Todo({required this.titulo, required this.data});

  String titulo;
  DateTime data;

  Todo.fromJson(Map<String, dynamic> json)
      : titulo = json['titulo'],
        data = DateTime.parse(json['data']);

  Map<String, dynamic> toJson() {
    return {"titulo": titulo, "data": data.toIso8601String()};
  }
}
