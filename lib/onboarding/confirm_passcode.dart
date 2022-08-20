import 'package:flutter/material.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:ethmexico/custom_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ethmexico/shared/shared_providers.dart';

class UserConfirmPasscodeScreen extends ConsumerStatefulWidget {
  const UserConfirmPasscodeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserConfirmPasscodeScreen> createState() =>
      _UserConfirmPasscodeScreenState();
}

class _UserConfirmPasscodeScreenState
    extends ConsumerState<UserConfirmPasscodeScreen> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  @override
  Widget build(BuildContext context) {
    final userPasscode = ref.watch(passcodeProvider);
    return PasscodeScreen(
        circleUIConfig:
            CircleUIConfig(borderColor: customGreen, fillColor: customGreen),
        keyboardUIConfig: KeyboardUIConfig(
            primaryColor: customGreen,
            digitTextStyle: TextStyle(color: customGreen, fontSize: 30)),
        backgroundColor: Colors.white,
        title: Text("Confirm your passcode"),
        passwordEnteredCallback: (passcode) {
          if (passcode == userPasscode) {
            context.go("/dashboard");
          } else {
            context.go("/");
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Passcodes do not match"),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.red,
                ));
          }
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
