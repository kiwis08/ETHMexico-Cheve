import 'package:intl/intl.dart';

class Transaction {
  Transaction({required this.bottleCount, required this.date});

  factory Transaction.fromStringDate({required bottleCount, required date}) {
    final formattedDate = DateFormat("yyyy-MM-dd").parse(date);
    return Transaction(bottleCount: bottleCount, date: formattedDate);
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    final count = map['bottleCount'];
    String strDate = map['date'];
    final formattedDate = DateFormat("yyyy-MM-dd").parse(strDate);
    return Transaction(bottleCount: count, date: formattedDate);
  }

  int bottleCount;
  DateTime date;
}