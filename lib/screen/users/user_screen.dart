import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/user_bloc.dart';
import 'bloc/user_event.dart';
import 'bloc/user_repository.dart';
import 'user_form.dart';


class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepository();
    return Scaffold(
        body: BlocProvider(
            create: (context) {
              return UserBloc(userRepository)
                ..add(const AppStarted());
            },
            child: const UserForm()));
  }
}
