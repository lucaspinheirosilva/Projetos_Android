import 'dart:io';
import 'package:lista_tarefas/model/todo.dart';
import 'package:lista_tarefas/pages/view/desktopLayout.dart';
import 'package:lista_tarefas/pages/view/mobileLayout.dart';
import 'package:lista_tarefas/widgets/todo_listItem.dart';
import 'package:window_size/window_size.dart' as window_size;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  if (!kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      window_size.setWindowMinSize(const Size(400, 200));
      window_size.setWindowMaxSize(Size.infinite);
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: TodoListPage());
  }
}

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    double larguraTela = MediaQuery.of(context).size.width;
    kDebugMode ? print('A LARGURA DA TELA È DE : $larguraTela') : null;
    return larguraTela<= 450.0?mobileLayout(context):desktopLayout(context);
  }

  Widget desktopLayout(BuildContext context) {
    kDebugMode ? print('ENTROU NO LAYOUT DESKTOP') : null;
    return DeskTopLayout();
  }

  Widget mobileLayout(BuildContext context) {
    kDebugMode ? print('ENTROU NO LAYOUT MOBILE') : null;
    return MobileLayout();
  }
}
