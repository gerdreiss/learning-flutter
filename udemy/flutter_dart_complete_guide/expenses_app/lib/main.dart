import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/chart.dart';
import 'widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 22,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction(
    //   id: 1,
    //   title: 'New Shoes',
    //   amount: 6999,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 2,
    //   title: 'Weekly Groceries',
    //   amount: 2359,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    var aWeekAgo = DateTime.now().subtract(Duration(days: 7));
    return _transactions.where((t) => t.date.isAfter(aWeekAgo)).toList();
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

  void _deleteTransaction(int id) {
    setState(() {
      _transactions.removeWhere((t) => t.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext parentContext) {
    showModalBottomSheet(
      context: parentContext,
      builder: (_) => GestureDetector(
        onTap: () {},
        child: NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Chart(_recentTransactions),
            ),
            TransactionList(_transactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
