import 'package:despesas/components/transaction_item.dart';
import 'package:despesas/src/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return transactions.isEmpty
        ? SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 25),
                Text(
                  'Nenhuma Transação',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 25),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                      color: Colors.white60,
                      colorBlendMode: BlendMode.srcATop,
                    )),
              ],
            ),
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];

              return TransactionItem(tr: tr, theme: theme, onRemove: onRemove);
            },
          );
  }
}
