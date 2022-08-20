import 'transaction.dart';

class WalletManager {


  Future<int> getUserBalance() async {
    // TODO: Get balance from backend
    return 18;
  }

  Future<List<Transaction>> getUserTransactions() async {
    // TODO: Get transactions from backend
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