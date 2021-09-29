import 'package:flutter/material.dart';

//vai chamar 1 coluna por vez, forma o Row em Chart
class ChartBar extends StatelessWidget {
  final String label;
  final double valueDay;
  final double percentage;

  ChartBar({
    required this.label,
    required this.percentage,
    required this.valueDay,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            //vai limitar o espaco para o texto e diminuir o tamanho dele se preciso
            child: Text('${valueDay.toStringAsFixed(2)}'),
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            //stack = usado para montar a barra empilhando os elementos dela
            //virar a barra de cabeça para baixo
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
