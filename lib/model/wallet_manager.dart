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
    final response = await http.get(Uri.parse("http://MacBook-Air-de-Santiago-Quihui.local:3000/create-wallet"));
    print(response.body);
    if (response.statusCode == 200) {
      return PrivateWalletData.fromMap(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<double> getUserBalance(String address) async {
    print(address);
    final response = await http.get(Uri.parse("http://MacBook-Air-de-Santiago-Quihui.local:3000/balance?walletAddress=${address}"));
    print(response.body);
    print(jsonDecode(response.body)['balance']);
    if (response.statusCode == 200) {
      final balance = double.parse(jsonDecode(response.body)['balance']);
      return balance;
    }
    return 0.0;
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