import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ethmexico/custom_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      primarySwatch: customGreen,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      textTheme: GoogleFonts.ibmPlexMonoTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 10,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      buttonTheme: const ButtonThemeData(
        splashColor: Colors.transparent,
        buttonColor: Colors.black,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
        primarySwatch: customGreen,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        backgroundColor: Colors.black,
        textTheme:
        GoogleFonts.ibmPlexMonoTextTheme().apply(bodyColor: Colors.white),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 1,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          elevation: 10,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
    );
  }
}
