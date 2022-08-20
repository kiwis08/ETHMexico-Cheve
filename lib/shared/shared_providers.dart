import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ethmexico/model/wallet_manager.dart';
import 'package:ethmexico/model/transaction.dart';

final usernameProvider = StateProvider<String>((ref) => "");
final passcodeProvider = StateProvider<String>((ref) => "");
final transactionsProvider = FutureProvider((ref) {
  final wallet = WalletManager();
  return wallet.getUserTransactions();
});