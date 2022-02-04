import 'package:flutter/material.dart';

class Retry extends StatelessWidget {
  final String error;
  final Function() onTap;
  const Retry({Key? key,required this.error, required this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left:10, right: 10),
        child: Column(
          children: [
        const Icon(
          Icons.search_off,
          size: 50,
        ),
        Text(
          error,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
        ),
        TextButton(
          onPressed: () {
            onTap();
          },
          child: const Text('Reintentar', style: TextStyle(color: Colors.white)),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
                (state) => Theme.of(context).primaryColor),
          ),
        )
          ],
        ),
      ),
    );
  }
}
