import 'package:flutter/material.dart';
import 'package:ethmexico/shared/shared_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ethmexico/custom_color.dart';
import 'package:ethmexico/model/transaction.dart';
import 'bottle_transaction.dart';
import 'balance_text.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final name = ref.watch(usernameProvider);
    final transactions = ref.watch(transactionsProvider);
    final userBalance = ref.watch(userBalanceProvider);
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: false,
        title: Text("Hello, ${name}"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.qr_code_scanner))
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                            text: "Your ",
                            style: Theme.of(context).textTheme.headline5,
                            children: [TextSpan(text: "balance")]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: UserBalanceText(userBalance: userBalance),
                    )
                  ],
                ),
              ),
            ),
            BottleTransaction(transactions: transactions)
          ],
        ),
      ),
    );
  }
}
