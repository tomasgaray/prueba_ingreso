import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:prueba_ingreso/helpers/app_theme.dart';
import 'screen/users/user_screen.dart';

void main()async {
  await Hive.initFlutter();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba Ingreso',
      theme: appTheme,
      home: const UserScreen(),
    );
  }
}
