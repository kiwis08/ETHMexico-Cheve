import 'package:flutter/material.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:ethmexico/custom_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ethmexico/shared/shared_providers.dart';

class UserPasscodeScreen extends ConsumerStatefulWidget {
  const UserPasscodeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserPasscodeScreen> createState() => _UserPasscodeScreenState();
}

class _UserPasscodeScreenState extends ConsumerState<UserPasscodeScreen> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  @override
  Widget build(BuildContext context) {
    return PasscodeScreen(
      circleUIConfig: CircleUIConfig(borderColor: customGreen, fillColor: customGreen),
      keyboardUIConfig: KeyboardUIConfig(primaryColor: customGreen, digitTextStyle: TextStyle(color: customGreen, fontSize: 30)),
      backgroundColor: Colors.white,
        title: Text("Enter a 6 digit passcode"),
        passwordEnteredCallback: (passcode) {
        ref.read(passcodeProvider.notifier).state = passcode;
        context.push("/confirm-passcode");
        },
        cancelButton: Text("CANCEL"),
        deleteButton: Text("DELETE"),
        cancelCallback: () {
        context.pop();
        },
        shouldTriggerVerification: _verificationNotifier.stream);
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }
}
