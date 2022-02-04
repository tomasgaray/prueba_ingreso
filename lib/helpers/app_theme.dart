import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primaryColor: const Color(0xff00484e), 
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.red.shade200,
    textTheme: ButtonTextTheme.primary,
  ),
  appBarTheme:const AppBarTheme(
    color:  Color(0xff013b40),
  ),
  textTheme: const TextTheme(
    headline4: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.black,
    ),
  ),
);
