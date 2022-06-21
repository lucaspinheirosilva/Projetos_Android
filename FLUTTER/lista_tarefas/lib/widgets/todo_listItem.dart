import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:lista_tarefas/model/todo.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;
  Function(Todo) onDelete;

  TodoListItem({
    Key? key,
    required this.todo,
  required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        extentRatio: 0.28,
        //dismissible: DismissiblePane(onDismissed: () {}),
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: onDelete(todo),
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
}
