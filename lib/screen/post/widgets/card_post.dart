import 'package:flutter/material.dart';
import 'package:prueba_ingreso/models/post.dart';

class CardPost extends StatelessWidget {
  final Post post;
  const CardPost({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     TextStyle titleStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16
    );
    
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title!, style:titleStyle,),
            Text(post.body!)
          ],
        ),
      ),
    );
  }
  }
