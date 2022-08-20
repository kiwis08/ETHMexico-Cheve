import 'package:flutter/material.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:ethmexico/custom_color.dart';

class UserPasscodeScreen extends StatefulWidget {
  const UserPasscodeScreen({Key? key}) : super(key: key);

  @override
  State<UserPasscodeScreen> createState() => _UserPasscodeScreenState();
}

class _UserPasscodeScreenState extends State<UserPasscodeScreen> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  @override
  Widget build(BuildContext context) {
    return PasscodeScreen(
      circleUIConfig: CircleUIConfig(borderColor: customGreen, fillColor: customGreen),
      keyboardUIConfig: KeyboardUIConfig(primaryColor: customGreen, digitTextStyle: TextStyle(color: customGreen, fontSize: 30)),
      backgroundColor: Colors.white,
        title: Text("Passcode"),
        passwordEnteredCallback: (passcode) {
        context.go("/dashboard");
        },
        cancelButton: ElevatedButton(
          onPressed: () {
            context.pop();
          },
          child: Text("CANCEL"),
        ),
        deleteButton: Text("DELETE"),
        shouldTriggerVerification: _verificationNotifier.stream);
  }
}
