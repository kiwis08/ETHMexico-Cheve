import 'dart:convert';
import 'package:http/http.dart' as http;
import 'transaction.dart';

class PrivateWalletData {
  PrivateWalletData({required this.address, required this.privateKey});
  factory PrivateWalletData.fromMap(Map<String, dynamic> map) {
    return PrivateWalletData(address: map['addres'], privateKey: map['privateKey']);
  }
  final String address;
  final String privateKey;
}

class WalletManager {

  Future<PrivateWalletData?> createWallet() async {
    final response = await http.get(Uri.parse("http://168.62.174.55/create-wallet"));
    print(response.body);
    if (response.statusCode == 200) {
      return PrivateWalletData.fromMap(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<double> getUserBalance(String address) async {
    // TODO: Get balance from backend
    final response = await http.get(Uri.parse("http://168.62.174.55/balance?walletAddress=${address}"));
    print(response.body);
    return 40.34;
  }

  Future<List<Transaction>> getUserTransactions() async {
    // TODO: Get transactions from backend
    await Future.delayed(Duration(seconds: 1));
    List<Transaction> transactions;
    transactions = [
      Transaction.fromStringDate(bottleCount: 5, date: "2022-08-20"),
      Transaction.fromStringDate(bottleCount: 2, date: "2022-08-19"),
      Transaction.fromStringDate(bottleCount: 10, date: "2022-08-15"),
      Transaction.fromStringDate(bottleCount: 3, date: "2022-08-08"),
      Transaction.fromStringDate(bottleCount: 6, date: "2022-07-29"),
      Transaction.fromStringDate(bottleCount: 3, date: "2022-07-20"),
      Transaction.fromStringDate(bottleCount: 5, date: "2022-07-18"),
      Transaction.fromStringDate(bottleCount: 4, date: "2022-07-12"),
    ];
    transactions.sort((a, b) => a.date.compareTo(b.date));
    return transactions;
  }

}