import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/models/Transaction.dart';
import 'package:flutter/material.dart';

import 'components/transaction_list.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
    return MaterialApp(
      theme: tema
          .copyWith(
            colorScheme: tema.colorScheme.copyWith(
                primary: Colors.purple,
                secondary: Colors.amber,
                tertiary: Colors.white),
          )
          .copyWith(
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(fontFamily: 'Caveat', fontSize: 35),
            ),
          )
          .copyWith(
              textTheme: ThemeData().textTheme.copyWith(
                      titleSmall:const TextStyle(
                    fontFamily: 'Josefin',
                    fontWeight: FontWeight.bold,
                  ))),
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transaction = [
    // Transaction(
    //     id: 't1',
    //     title: 'Tênis de corrida',
    //     value: 199.90,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'Conta de Luz', value: 235.85, date: DateTime.now()),
  ];

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return TransactionForm(_addTransaction);
        });
  }

  _addTransaction(String titulo, double valor) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: titulo,
        value: valor,
        date: DateTime.now());

    setState(() {
      _transaction.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton.outlined(
              onPressed: () => _openTransactionFormModal(context),
              color: Theme.of(context).colorScheme.tertiary,
              icon: const Icon(Icons.add)),
        ],
        elevation: 2,
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.elliptical(0, 0),
            bottomLeft: Radius.elliptical(80, 70),
          ),
        ),
        title: Text('Despesas Pessoais',
            style: TextStyle(color: Theme.of(context).colorScheme.tertiary)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //GRAFICO
            Container(
              child: Card(child: Text('Gráfico')),
            ),
            //LISTA DE DESPESAS
            TransactionList(_transaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          onPressed: () => _openTransactionFormModal(context),
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
