import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:prueba_ingreso/helpers/helper.dart';
import 'package:prueba_ingreso/models/post.dart';
import 'package:prueba_ingreso/models/user/user.dart';
import 'package:prueba_ingreso/screen/post/bloc/post_event.dart';
import 'package:prueba_ingreso/widgets/loading.dart';
import 'package:prueba_ingreso/widgets/retry.dart';
import 'bloc/post_bloc.dart';
import 'bloc/post_state.dart';
class PostForm extends StatelessWidget {
  final User user;
  const PostForm({Key? key,required this.user}) : super(key: key);
  

  Widget showPost(Post post){
    TextStyle titleStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15
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
   Widget showBody(PostState state, List<Post> posts, BuildContext context){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            return showPost(posts[index]);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name!),),
        body: BlocListener<PostBloc, PostState>(
              listener: (context, state) async {
            if (state is PostFailure) {
              Helper.showToasError(context, state.error ?? "Error");
            }
          }, child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
              if(state is PostLoading){
                    return loading(state.message, Theme.of(context).primaryColor, textColor:  Theme.of(context).primaryColor);
                  }
                  if(state is PostFailure){
                    return Retry(error: state.error??"", onTap: (){
                        context.read<PostBloc>().add( GetPostByUserId(userId: user.id!));
                      },
                    );
                  }
                  if(state is FindPosts){
                    return showBody(state, state.posts, context);
                  }
                  if(state is ListEmptyPosts){
                    return const Center(child: Text("List is Empty"));
                  }
                  return Container();
                
          })
        ),
      );
  }
}
