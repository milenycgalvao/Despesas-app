import 'package:despesas/components/chart.dart';
import 'package:despesas/components/transaction_form.dart';
import 'package:despesas/src/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

import 'components/transaction_list.dart';

main() => runApp(DespesasApp());

class DespesasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: theme.colorScheme.copyWith(
            secondary: Colors.red.shade800,
            primary: Colors.purple.shade800,
          ),
          fontFamily: 'Quicksand',
          textTheme: TextTheme(
              headline6: TextStyle(
            fontFamily: 'OpenSans',
            //considerar o tamanho de fonte que o usuario configurou no proprio celular
            fontSize: 15 /** MediaQuery.of(context).textScaleFactor*/,
            fontWeight: FontWeight.w700,
          ))),
    );
  }
} //colorScheme.secondary

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [];

  List<Transaction> get _recentTransactions {
    return transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      transactions.add(newTransaction);
    });

    Navigator.of(context).pop(); //fechando o modal
  }

  _removeTransaction(String id) {
    setState(() {
      transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransactionsFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        'Despesas',
        style: TextStyle(fontSize: 18),
      ),
      actions: [
        IconButton(
            onPressed: () => _openTransactionsFormModal(context),
            icon: Icon(Icons.add))
      ],
    );

    final availabelHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    //retrato
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Visibility(
          visible: isPortrait,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: availabelHeight * 0.25,
                child: Chart(_recentTransactions),
              ),
              Container(
                height: availabelHeight * 0.75,
                child: TransactionList(transactions, _removeTransaction),
              ),
            ],
          ),
          replacement: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: availabelHeight * 0.4,
                child: Chart(_recentTransactions),
              ),
              Container(
                height: availabelHeight * 0.6,
                child: TransactionList(transactions, _removeTransaction),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionsFormModal(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
