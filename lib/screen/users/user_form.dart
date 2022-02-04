import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:prueba_ingreso/helpers/helper.dart';
import 'package:prueba_ingreso/models/user/user.dart';
import 'package:prueba_ingreso/screen/users/bloc/user_event.dart';
import 'package:prueba_ingreso/screen/users/widgets/card_user.dart';
import 'package:prueba_ingreso/widgets/list_empty.dart';
import 'package:prueba_ingreso/widgets/loading.dart';
import 'package:prueba_ingreso/widgets/retry.dart';
import 'package:prueba_ingreso/widgets/search_bar.dart';
import 'bloc/user_bloc.dart';
import 'bloc/user_state.dart';
import 'widgets/card_user.dart';

class UserForm extends StatelessWidget {
  const UserForm({Key? key}) : super(key: key);


  Widget showBody(UserState state, List<User> users, BuildContext context){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return CardUser(user:users[index]);
          },
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Prueba de Ingreso"),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SearchBar(hit:"Buscar por nombre", onTextChange: (name){
                  BlocProvider.of<UserBloc>(context).add(SearchUserByName(name: name));
                },
                onClean: (){
                  BlocProvider.of<UserBloc>(context).add(GetLocalUsers());
                },
              ),
              BlocListener<UserBloc, UserState>(
                    listener: (context, state) async {
                  if (state is UserFailure) {
                    Helper.showToasError(context, state.error ?? "Error");
                  }
                }, child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                  if(state is UserLoading){
                    return loading(state.message, Theme.of(context).primaryColor, textColor:  Theme.of(context).primaryColor);
                  }
                  if(state is UserFailure){
                    return Retry(error: state.error??"", onTap: (){
                        context.read<UserBloc>().add( const AppStarted());
                      },
                    );
                  }
                  if(state is FindUsers){
                    return showBody(state, state.users, context);
                  }
                  if(state is ListEmpty){
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
