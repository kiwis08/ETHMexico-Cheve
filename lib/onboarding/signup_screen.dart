import 'package:flutter/material.dart';
import 'package:ethmexico/shared/shared_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ethmexico/shared/shared_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ethmexico/custom_color.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Welcome! What's your name?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                RoundedTextFormField(
                  controller: usernameController,
                  labelText: "USERNAME",
                  inputType: TextInputType.text,
                  prefixIcon: Icon(Icons.person),
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: customGreen,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    onPressed: () {
                      ref.read(usernameProvider.notifier).state =
                          usernameController.text;
                      context.push("/passcode");
                    },
                    icon: Icon(Icons.arrow_forward_rounded),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
