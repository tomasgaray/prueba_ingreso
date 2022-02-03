import 'package:flutter/material.dart';

Widget loading(String text, Color color,
    {Color textColor = Colors.green, double height = 60.0}) {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        Container(
          height: height,
        ),
        Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            strokeWidth: 4.0,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
        const SizedBox(
          height: 25.0,
        ),
        Text(
          text,
          style: TextStyle(color: textColor),
        )
      ],
    ),
  );
}
