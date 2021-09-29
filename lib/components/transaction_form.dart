import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  var _selectedDate = DateTime.now();

  _submitForm() {
    print(titleController.text);
    print(valueController.text);
    print(_selectedDate);

    final title = titleController.text;
    final value = double.parse(valueController.text);
    final DateTime date = _selectedDate;

    //p nao deixar chamar o on sobmit sem nada ou apenas c o titulo
    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value, date);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      //aqui dentro só acontece quando o usuario da ok na data escolhida
      setState(() {
        _selectedDate = pickedDate!;
        print(_selectedDate);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
              onSubmitted: (_) => _submitForm(),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              //assim ^ os decimais aparecem tanto no android quanto no ios
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
              onSubmitted: (_) => _submitForm(),
              //assim porque onSubmited nao aceita funcao sem parametro
            ),
            Row(
              children: [
                TextButton(
                  onPressed: _showDatePicker,
                  child: Text(
                    'Selecionar data',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    DateFormat('d MMM y').format(_selectedDate),
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text(
                'Salvar Transação',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: TextButton.styleFrom(primary: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
