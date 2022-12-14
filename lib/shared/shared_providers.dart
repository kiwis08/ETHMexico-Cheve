import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ethmexico/model/wallet_manager.dart';
import 'package:ethmexico/model/transaction.dart';

final usernameProvider = StateProvider<String>((ref) => "");
final passcodeProvider = StateProvider<String>((ref) => "");
final transactionsProvider = FutureProvider((ref) {
  final wallet = WalletManager();
  return wallet.getUserTransactions();
});
final userBalanceProvider = FutureProvider((ref) {
  final address = ref.watch(walletAddressProvider);
  final wallet = WalletManager();
  return wallet.getUserBalance(address);
});

final walletAddressProvider = StateProvider<String>((ref) => "");
final privateKeyProvider = StateProvider<String>((ref) => "");