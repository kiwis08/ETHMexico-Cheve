import 'package:ethmexico/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:ethmexico/navigation/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ethmexico/shared/app_theme.dart';

void main() {
  runApp(ProviderScope(child:MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: appRouter.router.routeInformationParser,
      routerDelegate: appRouter.router.routerDelegate,
      routeInformationProvider: appRouter.router.routeInformationProvider,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      color: customGreen,
    );
  }
}