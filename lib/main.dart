import 'package:flutter/material.dart';
import 'package:prueba_ingreso/helpers/app_theme.dart';
import 'screen/users/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba Ingreso',
      theme: appTheme,
      home: const UserScreen(),
    );
  }
}
