import 'package:flutter/material.dart';
import 'package:prueba_ingreso/models/user/user.dart';
import 'package:prueba_ingreso/screen/post/post_screen.dart';

class CardUser extends StatelessWidget {
  final User user;
  const CardUser({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.name!, style: const TextStyle(fontWeight:  FontWeight.bold),),
            Row(children: [
              const Icon(Icons.phone, color: Colors.black54,),
              Text(user.phone!)
            ],),
             Row(children: 
             [
              const Icon(Icons.email, color: Colors.black54),
              Text(user.email!)
             ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PostScreen(user: user,)),
                    );
                  }, child:  Text("VER PUBLICACIONES", style:TextStyle(color: Theme.of(context).primaryColor)))
              ],
            )
          ],
        ),
      ),
    );
  }
}