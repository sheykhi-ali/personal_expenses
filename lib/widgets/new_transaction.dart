import 'package:flutter/material.dart';
import 'package:personal_expenses/res/utils.dart';

import '../models/transaction.dart';
import '../res/string.dart';

class NewTransaction extends StatefulWidget {
  final Function addnewTxElement;

  const NewTransaction(
    this.addnewTxElement, {
    super.key,
  });

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  void _submit() {
    final entredTitle = _titleController.text;
    final enteredPrice = _priceController.text;

    if (enteredPrice.isEmpty || entredTitle.isEmpty) return;

    widget.addnewTxElement(
      Transaction(
          id: DateTime.now().toString(),
          label: entredTitle,
          price: double.parse(enteredPrice),
          date: _pickedDate!),
    );

    Navigator.of(context).pop();
  }

  final _titleController = TextEditingController();

  final _priceController = TextEditingController();

  static DateTime? _pickedDate;

  void _openDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _pickedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _titleController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: const Icon(Icons.title),
              iconColor: Theme.of(context).primaryColor,
              label: const Text('Title'),
            ),
            onSubmitted: (_) => _submit(),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: _priceController,
            decoration: InputDecoration(
              icon: const Icon(Icons.price_change_sharp),
              iconColor: Theme.of(context).primaryColor,
              label: const Text(Strings.price),
            ),
            onSubmitted: (_) => _submit(),
          ),
          Row(
            children: [
              Text(_pickedDate == null
                  ? 'no date picked'
                  : getDateFormat(_pickedDate!)),
              TextButton(
                onPressed: _openDatePicker,
                child: const Text(
                  'Pick Date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          ElevatedButton(
            onPressed: () => _submit(),
            child: const Text(Strings.addTransaction),
          )
        ],
      ),
    );
  }
}
