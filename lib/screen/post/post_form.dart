import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:prueba_ingreso/helpers/helper.dart';
import 'package:prueba_ingreso/models/post.dart';
import 'package:prueba_ingreso/models/user/user.dart';
import 'package:prueba_ingreso/screen/post/bloc/post_event.dart';
import 'package:prueba_ingreso/widgets/content.dart';
import 'package:prueba_ingreso/widgets/list_empty.dart';
import 'package:prueba_ingreso/widgets/loading.dart';
import 'package:prueba_ingreso/widgets/retry.dart';
import 'bloc/post_bloc.dart';
import 'bloc/post_state.dart';
import 'widgets/card_post.dart';
class PostForm extends StatelessWidget {
  final User user;
  const PostForm({Key? key,required this.user}) : super(key: key);
  
  Widget showTitle(String title){
    return Column(
      children: [
        const Divider(height: 1,),
        Padding(
          padding: const EdgeInsets.only(top:3.0, bottom: 3.0),
          child: Text(title, style: TextStyle(
            fontSize: 15, 
            fontWeight: FontWeight.bold,
            color:  Colors.blueGrey[20]
          ),),
        ),
        const Divider(height: 1,)
      ],
  );
  }

  Widget showUserData(BuildContext context){
    return  Padding(
      padding: const EdgeInsets.only(left:10.0, right: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width/2.2,
                child: Content(
                  title: "Nombre",
                  child: Text(user.name!),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/2.2,
                child: Content(
                  title: "Teléfono",
                  child: Text(user.phone!),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width/2.2,
                child: Content(
                  title: "Sitio Web",
                  child: Text(user.website!),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/2.2,
                child: Content(
                  title: "Correo",
                  child: Text(user.email!),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
        ],
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
            return CardPost(post:posts[index]);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name!),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              showUserData(context),
              showTitle("PUBLICACIONES"),
              BlocListener<PostBloc, PostState>(
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
                          return const ListIsEmpy();
                        }
                        return Container();
                      
                })
              ),
            ],
          ),
        ),
      );
  }
}
