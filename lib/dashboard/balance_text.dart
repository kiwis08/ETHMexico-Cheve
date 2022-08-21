import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ethmexico/custom_color.dart';

class UserBalanceText extends StatelessWidget {
  const UserBalanceText({Key? key, required this.userBalance})
      : super(key: key);

  final AsyncValue<double> userBalance;

  @override
  Widget build(BuildContext context) {
    return userBalance.when(
      data: (data) {
        return RichText(
          text: TextSpan(
              text: "\$${data}",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: " MATIC",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: customGreen,
                        fontSize: 20))
              ]),
        );
      },
      error: (error, st) => Text(error.toString()),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
