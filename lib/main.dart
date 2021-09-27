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
          secondary: Colors.red.shade800, //faz o que faz o accentColor
          primary: Colors.purple.shade800, //faz o que faz o primaryColor
        ),
        //alterar de forma global a fonte:
        fontFamily: 'Quicksand',
      ),
    );
  }
} //colorScheme.secondary

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

    //widget do tipo statefull
    Navigator.of(context).pop(); //fechando o modal
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
    //p poder chamar as cores temas dentro do build (ou outra classe/arquivo)
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Despesas',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
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
                color: theme.colorScheme.primary,
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
