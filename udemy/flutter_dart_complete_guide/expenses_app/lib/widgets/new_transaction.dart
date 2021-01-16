import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  State<StatefulWidget> createState() {
    return new _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _dateFormatter = DateFormat('dd/MM/yyyy');

  final _titleController = new TextEditingController();
  final _amountController = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
    leftSymbol: 'CHF',
  );
  final _dateController = new TextEditingController();

  void _submitNewTransaction() {
    final titleInput = _titleController.text;
    final amountInput = (_amountController.numberValue * 100).toInt();
    final dateInput = _dateController.text.isEmpty
        ? DateTime.now()
        : _dateFormatter.parse(_dateController.text);
    if (titleInput.isNotEmpty && amountInput > 0) {
      widget.addNewTransaction(titleInput, amountInput, dateInput);
      Navigator.of(context).pop();
    }
  }

  void _selectDate(BuildContext context) async {
    var initialDate = DateTime.now();
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2021),
      lastDate: initialDate,
    );
    if (picked != null) {
      _dateController
        ..text = _dateFormatter.format(picked)
        ..selection = TextSelection.fromPosition(
          TextPosition(
              offset: _dateController.text.length,
              affinity: TextAffinity.upstream),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: new InputDecoration(
                labelText: 'Title',
                icon: Icon(Icons.text_fields),
              ),
              controller: _titleController,
              onSubmitted: (_) => _submitNewTransaction(),
            ),
            TextField(
              decoration: new InputDecoration(
                labelText: 'Amount',
                icon: Icon(Icons.money),
              ),
              keyboardType: TextInputType.number,
              controller: _amountController,
              onSubmitted: (_) => _submitNewTransaction(),
            ),
            TextField(
              focusNode: AlwaysDisabledFocusNode(),
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date',
                icon: Icon(Icons.calendar_today),
              ),
              onTap: () => _selectDate(context),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: RaisedButton(
                child: Text('Add Transaction'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _submitNewTransaction,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
