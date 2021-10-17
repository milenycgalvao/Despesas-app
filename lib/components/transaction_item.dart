import 'package:despesas/src/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    required this.tr,
    required this.theme,
    required this.onRemove,
  });

  final Transaction tr;
  final ThemeData theme;
  final void Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(
              child: Text(
                'R\$${tr.value.toStringAsFixed(2)}',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          backgroundColor: theme.colorScheme.secondary,
        ),
        title: Text(
          tr.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(tr.date),
        ),
        trailing: IconButton(
          onPressed: () => onRemove(tr.id),
          icon: Icon(Icons.delete),
          color: Colors.grey,
        ),
      ),
    );
  }
}
