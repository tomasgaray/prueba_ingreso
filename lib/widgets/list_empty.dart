import 'package:flutter/material.dart';

class ListIsEmpy extends StatelessWidget {
  const ListIsEmpy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(child:  Column(
        children: const [
          Icon(Icons.search_off, color: Colors.black,),
          Text("List is Empty"),
        ],
      )
    );
  }
}