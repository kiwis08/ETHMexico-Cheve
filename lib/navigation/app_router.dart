import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:ethmexico/onboarding/signup_screen.dart';
import 'package:ethmexico/onboarding/passcode.dart';
import 'package:ethmexico/dashboard/dashboard_screen.dart';

class AppRouter {
  AppRouter();

  final router = GoRouter(
    initialLocation: "/",
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: SignUpScreen(),
        ),
      ),
      GoRoute(
        path: '/passcode',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: UserPasscodeScreen(),
        ),
      ),
      GoRoute(
        path: '/dashboard',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: DashboardScreen(),
        ),
      ),
    ],
  );
}
