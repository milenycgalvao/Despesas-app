import 'package:despesas/components/transaction_form.dart';
import 'package:despesas/src/transaction.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'components/transaction_list.dart';

main() => runApp(DespesasApp());

class DespesasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final transactions = [
    //lista provisoria que nao vai ser alterada ainda
    Transaction(
        id: 't1',
        title: 'Conta de Internet',
        value: 230.80,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Comprinha na Shopee',
        value: 23.45,
        date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      transactions.add(newTransaction);
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas'),
        backgroundColor: Colors.purple,
        actions: [
          //widget
          IconButton(
              onPressed: () => _openTransactionsFormModal(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        //p fazer a rolagem
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                color: Colors.purple,
                child: Text(
                  'Gráfico',
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 5,
              ),
            ),
            TransactionList(transactions),
          ],
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
