import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ethmexico/model/transaction.dart';
import 'package:ethmexico/custom_color.dart';

class BottleTransaction extends StatelessWidget {
  final AsyncValue<List<Transaction>> transactions;

  const BottleTransaction({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              "Your activity",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          transactions.when(
              data: (data) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TransactionRow(
                        transaction: data[index],
                      );
                    },
                  ),
                );
              },
              error: (error, st) => Text(error.toString()),
              loading: () => Center(
                    child: CircularProgressIndicator(),
                  )),
        ],
      ),
    );
  }
}

class TransactionRow extends StatelessWidget {
  const TransactionRow({Key? key, required this.transaction}) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/deposit.svg"),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bottle deposit",
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(DateFormat("yyyy-MM-dd").format(transaction.date)),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              "+\$${transaction.amount}",
              style: TextStyle(color: customGreen, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
