import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Transaction {
  final int id;
  final String title;
  final int amount; // cents or rappen or similar
  final DateTime date;

  final _formatCurrency = NumberFormat.simpleCurrency(name: 'CHF');
  final _formatDate = DateFormat('dd.MM.yyyy HH:mm');

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});

  String formattedAmount() {
    return _formatCurrency.format(amount / 100);
  }

  String formattedDate() {
    return _formatDate.format(date);
  }
}
