import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 1,
      title: 'New Shoes',
      amount: 6999,
      date: DateTime.now(),
    ),
    Transaction(
      id: 2,
      title: 'Weekly Groceries',
      amount: 2359,
      date: DateTime.now(),
    ),
  ];

  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(_addNewTransaction),
      TransactionList(_transactions, (id) {}),
    ]);
  }

  void _addNewTransaction(String title, int amount, DateTime date) {
    final newTx = new Transaction(
      id: _transactions.length + 1,
      title: title,
      amount: amount,
      date: date,
    );
    setState(() {
      _transactions.add(newTx);
    });
  }
}
