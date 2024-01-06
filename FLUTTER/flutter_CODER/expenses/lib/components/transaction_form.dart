import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.black)
                  .copyWith(fontSize: 18),
              decoration: InputDecoration(
                label: Text('Título',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary)),
                labelStyle: const TextStyle(
                    fontFamily: 'Caveat',
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.black)
                  .copyWith(fontSize: 18),
              decoration: InputDecoration(
                label: Text('Valor (R\$)',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary)),
                labelStyle: const TextStyle(
                    fontFamily: 'Caveat',
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _submitForm,
                  child: const Text(
                    'Nova Tarefa',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
