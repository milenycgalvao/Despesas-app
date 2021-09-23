import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    print(titleController.text);
    print(valueController.text);

    final title = titleController.text;
    final value = double.parse(valueController.text);

    //p nao deixar chamar o on sobmit sem nada ou apenas c o titulo
    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value);
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
              child: Text('Salvar Transação'),
              style: TextButton.styleFrom(primary: Colors.red.shade800),
            )
          ],
        ),
      ),
    );
  }
}
