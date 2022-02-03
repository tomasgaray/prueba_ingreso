import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primaryColor: Colors.blue.shade900, 
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.red.shade200,
    textTheme: ButtonTextTheme.primary,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.blue.shade800,
  ),
  textTheme: const TextTheme(
    headline4: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.black,
    ),
  ),
);
