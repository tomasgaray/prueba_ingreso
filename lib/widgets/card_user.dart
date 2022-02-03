import 'package:flutter/material.dart';
import 'package:prueba_ingreso/models/user/user.dart';

class CardUser extends StatelessWidget {
  final User user;
  const CardUser({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("SOY EL USUARIO" + user.name!),
          Text("ID" + user.id.toString()),
          Text("UserID" + user.userName!),
        ],
      ),
    );
  }
}