import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  State<StatefulWidget> createState() {
    return new _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = new TextEditingController();
  final amountController = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
    leftSymbol: 'CHF',
  );

  void submitNewTransaction() {
    final titleInput = titleController.text;
    final amountInput = (amountController.numberValue * 100).toInt();
    if (titleInput.isNotEmpty && amountInput > 0) {
      widget.addNewTransaction(titleInput, amountInput);
      Navigator.of(context).pop();
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
              decoration: new InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => submitNewTransaction(),
            ),
            TextField(
              decoration: new InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => submitNewTransaction(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitNewTransaction,
            )
          ],
        ),
      ),
    );
  }
}
