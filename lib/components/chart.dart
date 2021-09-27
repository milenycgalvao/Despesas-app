import 'package:despesas/components/chart_bar.dart';
import 'package:despesas/src/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  //funcao de agrupamento
  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0;
      for (int i = 0; i < recentTransaction.length; i++) {
        bool sameDay = weekDay.day == recentTransaction[i].date.day;
        bool sameMonth = weekDay.month == recentTransaction[i].date.month;
        bool sameYear = weekDay.year == recentTransaction[i].date.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }

      print(DateFormat.E().format(weekDay)[0]);
      print(totalSum);

      //pegar a primeira letra do dia da semana
      return {'day': DateFormat.E().format(weekDay)[0], 'value': totalSum};
    });
  }

  //funcao que retorna o total gasto na semana
  double get _weekTotalValue {
    return groupedTransactions.fold(
        0, (sum, tr) => sum + double.parse(tr['value'].toString()));
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;

    return Card(
      elevation: 4,
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactions.map((tr) {
          return ChartBar(
              label: tr['day'].toString(),
              percentage:
                  double.parse(tr['value'].toString()) / _weekTotalValue,
              valueDay: double.parse(tr['value'].toString()));
          //Text('${tr['day']} : ${tr['value']} ');
        }).toList(),
      ),
    );
  }
}
