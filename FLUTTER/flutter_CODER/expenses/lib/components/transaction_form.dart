import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text.contains(',')
            ? _valueController.text = _valueController.text.replaceAll(',', '.')
            : _valueController.text) ??
        0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  _showDataPicker() {
    var date = DateTime.now();
    showDatePicker(
      context: context,
      firstDate: DateTime(date.year, date.month - 3, date.day),
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
    ).then((dataPicked) => {
          if (dataPicked != null)
            {
              setState(() {
                _selectedDate = dataPicked;
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
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
                controller: _valueController,
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
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                        child: Text(_selectedDate == null
                            ? "Nunhuna Data Selecionada!"
                            : "Data Selecionada ${DateFormat('dd/MM/yyy').format(_selectedDate)}")),
                    TextButton(
                        onPressed: _showDataPicker,
                        child: const Text("Selecione a Data"))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1);
                          }
                          return Theme.of(context).colorScheme.primary;
                        },
                      ),
                    ),
                    onPressed: _submitForm,
                    child: const Text(
                      'Nova Tarefa',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
