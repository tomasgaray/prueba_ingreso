import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:prueba_ingreso/helpers/helper.dart';
import 'package:prueba_ingreso/screen/post/bloc/post_event.dart';
import 'package:prueba_ingreso/widgets/loading.dart';
import 'package:prueba_ingreso/widgets/retry.dart';

import 'bloc/post_bloc.dart';
import 'bloc/post_state.dart';

class PostForm extends StatelessWidget {
  final int userId;
  const PostForm({Key? key,required this.userId}) : super(key: key);

  // BlocProvider.of<HomeBloc>(context)
  //                               .add(AppStartedHome(user: user));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Prueba"),),
        body: BlocListener<PostBloc, PostState>(
              listener: (context, state) async {
            // if (state is FindDashBoard) {
            //   stats = state.stats;
            // }
            // if (state is HomeFindLastSalesOrder) {
            //   lastSalesOrder = state.order;
            // }

            if (state is PostFailure) {
              Helper.showToasError(context, state.error ?? "Error");
            }
          }, child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                    children: [
                      state is PostLoading ? loading(state.message, Theme.of(context).primaryColor, textColor:  Theme.of(context).primaryColor)
                      :state is PostFailure ? 
                      Retry(error: state.error??"", onTap: (){
                        context.read<PostBloc>().add(GetPostByUserId(userId: userId));
                      },
                      )
                      :state is FindPosts  ?
                           SingleChildScrollView(
                              child: ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.posts.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Text("Post");
                                },
                              ),
                                    
                            )
                      : const Center(child: Text("List is Empty"))
                    ],
                  )
                ],
              ),
            );
          })),);
  }
}
