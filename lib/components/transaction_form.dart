import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm() {
    print(titleController.text);
    print(valueController.text);

    final title = titleController.text;
    final value = double.parse(valueController.text);

    //p nao deixar chamar o on sobmit sem nada ou apenas c o titulo
    if (title.isEmpty || value <= 0) {
      return;
    }

    onSubmit(title, value);
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
            TextButton(
              onPressed: _submitForm,
              child: Text('Nova Transação'),
              style: TextButton.styleFrom(primary: Colors.red.shade800),
            )
          ],
        ),
      ),
    );
  }
}
