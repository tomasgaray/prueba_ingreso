import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:prueba_ingreso/helpers/helper.dart';
import 'package:prueba_ingreso/screen/users/bloc/user_event.dart';
import 'package:prueba_ingreso/widgets/card_user.dart';
import 'package:prueba_ingreso/widgets/loading.dart';
import 'package:prueba_ingreso/widgets/retry.dart';

import 'bloc/user_bloc.dart';
import 'bloc/user_state.dart';

class UserForm extends StatelessWidget {
  const UserForm({Key? key}) : super(key: key);

  // BlocProvider.of<HomeBloc>(context)
  //                               .add(AppStartedHome(user: user));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Prueba"),),
        body: BlocListener<UserBloc, UserState>(
              listener: (context, state) async {
            if (state is UserFailure) {
              Helper.showToasError(context, state.error ?? "Error");
            }
          }, child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                    children: [
                      state is UserLoading ? loading(state.message, Theme.of(context).primaryColor, textColor:  Theme.of(context).primaryColor)
                      :state is UserFailure ? 
                      Retry(error: state.error??"", onTap: (){
                        context.read<UserBloc>().add( const AppStarted());
                      },
                      )
                      :state is FindUsers  ?
                           SingleChildScrollView(
                              child: ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.users.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CardUser(user:state.users[index]);
                                },
                              ),
                                    
                            )
                      : const Center(child: Text("List is Empty"))
                    ],
                  )
                ],
              ),
            );
          })
        ),
      );
  }
}
