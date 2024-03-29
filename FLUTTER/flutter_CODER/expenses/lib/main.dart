import 'dart:math';

import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'components/transaction_list.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

main() {
  initializeDateFormatting('pr_BR', null);
  return runApp(ExpensesApp());
}

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
                      titleSmall: const TextStyle(
                    fontFamily: 'Josefin',
                    fontWeight: FontWeight.bold,
                  ))),
      debugShowCheckedModeBanner: false,
      // Remove the debug banner
      supportedLocales: const [Locale('pt')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transaction = [];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transaction.where((element) {
      return element.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return TransactionForm(_addTransaction);
        });
  }

  _addTransaction(String titulo, double valor, DateTime date) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: titulo,
        value: valor,
        date: date);

    setState(() {
      _transaction.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransacao(String id) {
    setState(() {
      _transaction.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool _isLandscape =
        mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      centerTitle: true,
      actions: [
        if (_isLandscape)
          IconButton.outlined(
            tooltip: _showChart ? "Exibir Lista" : "Exibir Gráfico",
            onPressed: () => {
              setState(() {
                _showChart = !_showChart;
              })
            },
            color: Theme.of(context).colorScheme.tertiary,
            icon: _showChart
                ? const Icon(Icons.list)
                : const Icon(Icons.bar_chart),
          ),
        IconButton.outlined(
            onPressed: () => _openTransactionFormModal(context),
            color: Theme.of(context).colorScheme.tertiary,
            icon: const Icon(Icons.add))
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
    );

    final alturaDisponivel = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;
    mediaQuery.padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //GRAFICO
            if (_showChart || !_isLandscape)
              SizedBox(
                  height: alturaDisponivel * (_isLandscape ? 0.8 : 0.2),
                  child: Chart(_recentTransactions)),
            //LISTA DE DESPESAS
            if (!_showChart || !_isLandscape)
              SizedBox(
                  height: alturaDisponivel * (_isLandscape ? 0.95 : 0.75),
                  child: TransactionList(_transaction, _removeTransacao)),
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
