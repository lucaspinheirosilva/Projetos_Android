import 'dart:io';
import 'package:conversor_moedas/widgets/appBarra.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart' as window_size;

import 'controller/conversorController.dart';

//Sua chave conversor_moeda 351b5cf1
void main() {
  if (!kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      window_size.setWindowMinSize(const Size(600, 600));
      //window_size.setWindowMaxSize(const Size(800, 800));
    }
  }
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ConversorController(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomeApp(),
      ),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({Key? key}) : super(key: key);

  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  @override
  Widget build(BuildContext context) {
    ConversorController controller = context.watch<ConversorController>();
    double larguraTela = MediaQuery.of(context).size.width;
    double alturaTela = MediaQuery.of(context).size.height;
    kDebugMode
        ? debugPrint(
            'tela com LARGURA de ->$larguraTela e ALTURA de -> $alturaTela')
        : null;
    return larguraTela <= 450.0
        ? barAppMobile(ontapReset: () => controller.resetCampo())
        : barAppDesktop(ontapReset: () => controller.resetCampo());
  }

}
