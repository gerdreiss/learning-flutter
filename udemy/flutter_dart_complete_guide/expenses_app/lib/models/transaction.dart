import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Transaction {
  final int id;
  final String title;
  final int amount; // cents or rappen or similar
  final DateTime date;

  final _formatCurrencyAmount =
      NumberFormat.simpleCurrency(name: '', decimalDigits: 2);
  final _formatCurrency =
      NumberFormat.currency(symbol: 'CHF ', decimalDigits: 2);
  final _formatDate = DateFormat('dd.MM.yyyy HH:mm');

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});

  String get formattedAmountNoCurrency {
    return _formatCurrencyAmount.format(amount / 100);
  }

  String get formattedAmount {
    return _formatCurrency.format(amount / 100);
  }

  String get formattedDate {
    return _formatDate.format(date);
  }

  String getFormattedAmount(String currency) {
    return NumberFormat.currency(symbol: currency, decimalDigits: 2)
        .format(amount / 100);
  }
}
