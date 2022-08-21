import 'package:intl/intl.dart';

class Transaction {
  Transaction({required this.bottleCount, required this.date}) : this.amount = bottleCount * 3.42; // TODO: Calculate amount

  factory Transaction.fromStringDate({required bottleCount, required date}) {
    final formattedDate = DateFormat("yyyy-MM-dd").parse(date);
    return Transaction(bottleCount: bottleCount, date: formattedDate);
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    final int count = map['bottleCount'];
    String strDate = map['date'];
    final formattedDate = DateFormat("yyyy-MM-dd").parse(strDate);
    return Transaction(bottleCount: count, date: formattedDate);
  }

  int bottleCount;
  DateTime date;
  double amount;
}