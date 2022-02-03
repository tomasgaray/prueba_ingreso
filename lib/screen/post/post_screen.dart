import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_ingreso/models/user/user.dart';
import 'package:prueba_ingreso/screen/post/bloc/post_event.dart';
import 'bloc/post_bloc.dart';
import 'bloc/post_repository.dart';
import 'post_form.dart';

class PostScreen extends StatelessWidget {
  final User user;
  const PostScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postRepository = PostRepository();
    return Scaffold(
        body: BlocProvider(
            create: (context) {
              return PostBloc(postRepository)
                ..add(GetPostByUserId(userId:user.id!));
            },
            child: PostForm(user: user,)));
  }
}
