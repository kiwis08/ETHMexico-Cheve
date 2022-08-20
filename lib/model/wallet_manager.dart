import 'transaction.dart';

class WalletManager {


  Future<double> getUserBalance() async {
    // TODO: Get balance from backend
    await Future.delayed(Duration(seconds: 2));
    return 40.34;
  }

  Future<List<Transaction>> getUserTransactions() async {
    // TODO: Get transactions from backend
    await Future.delayed(Duration(seconds: 3));
    List<Transaction> transactions;
    transactions = [
      Transaction.fromStringDate(bottleCount: 5, date: "2022-08-20"),
      Transaction.fromStringDate(bottleCount: 2, date: "2022-08-19"),
      Transaction.fromStringDate(bottleCount: 10, date: "2022-08-15"),
      Transaction.fromStringDate(bottleCount: 3, date: "2022-08-08"),
    ];
    return transactions;
  }

}