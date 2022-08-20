import 'package:flutter/material.dart';
import 'package:ethmexico/shared/shared_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ethmexico/shared/shared_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ethmexico/custom_color.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final usernameController = TextEditingController();

  bool validUserName = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Text(
                    "Welcome! What's your name?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
                Spacer(),
                RoundedTextFormField(
                  controller: usernameController,
                  labelText: "USERNAME",
                  inputType: TextInputType.text,
                  prefixIcon: Icon(Icons.person),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      validUserName = false;
                      return "Please enter a username";
                    } else if (text.length < 5) {
                      validUserName = false;
                      return "Username must be longer than 4 characters";
                    }
                    validUserName = true;
                    return null;
                  },
                ),
                Spacer(),
                ValueListenableBuilder(valueListenable: usernameController, builder: (context, TextEditingValue value, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: customGreen,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: IconButton(
                          onPressed: usernameController.value.text.isEmpty || usernameController.value.text.length < 5 ? null : () {
                            ref.read(usernameProvider.notifier).state =
                                usernameController.text;
                            context.push("/passcode");
                          },
                          icon: Icon(Icons.arrow_forward_rounded),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }
}

