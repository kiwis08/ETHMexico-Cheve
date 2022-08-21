import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ethmexico/shared/shared_providers.dart';
import 'package:ethmexico/custom_color.dart';

class PrivateKeyScreen extends ConsumerWidget {
  const PrivateKeyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final privateKey = ref.watch(privateKeyProvider);
    return Scaffold(
      body: Center(
        child: Padding(padding: EdgeInsets.all(16), child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("This is your private key, keep it somewhere safe", style: Theme.of(context).textTheme.titleLarge,),
            Text(privateKey),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: customGreen,
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () => context.go("/dashboard"),
                icon: Icon(Icons.arrow_forward_rounded),
              ),
            )
          ],
        ),),
      ),
    );
  }
}
