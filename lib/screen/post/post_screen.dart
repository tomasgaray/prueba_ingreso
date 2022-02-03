import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_ingreso/screen/post/bloc/post_event.dart';
import 'bloc/post_bloc.dart';
import 'bloc/post_repository.dart';
import 'post_form.dart';

class UserScreen extends StatelessWidget {
  final int userId;
  const UserScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postRepository = PostRepository();
    return Scaffold(
        body: BlocProvider(
            create: (context) {
              return PostBloc(postRepository)
                ..add(GetPostByUserId(userId:userId));
            },
            child: PostForm(userId: userId,)));
  }
}
