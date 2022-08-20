import 'package:ethmexico/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// por yaf

class BottleTransaction extends StatelessWidget {
  final List<Transaction> transactions;

  const BottleTransaction({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            "Activity",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
          Column(
            children: [for (var item in transactions) Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                padding: EdgeInsets.all(16),
                  width: size.width * 0.9,
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
                              Text(item.date),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text("+\$15.26"),
                  ],
                ),
              )
            ),],
          ),

      ],
    );
  }
}
