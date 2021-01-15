import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions);

  List<Transaction> get groupedTransactionValues {
    return List.generate(7, (index) {
      final currentDay = DateTime.now().subtract(Duration(days: index));
      final transactionSum = recentTransactions
          .where((t) =>
              t.date.day == currentDay.day &&
              t.date.month == currentDay.month &&
              t.date.year == currentDay.year)
          .map((t) => t.amount)
          .fold(0, (acc, curr) => acc + curr);
      return Transaction(
        id: -1,
        title: DateFormat.E().format(currentDay),
        amount: transactionSum,
        date: currentDay,
      );
    });
  }

  int get sumAllTransactions {
    return recentTransactions
        .map((t) => t.amount)
        .fold(0, (acc, curr) => acc + curr);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues
              .map(
                (t) => Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    t.title,
                    t.formattedAmountNoCurrency,
                    sumAllTransactions == 0 ? 0 : t.amount / sumAllTransactions,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
