import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_ingreso/models/user/user.dart';
import 'user_event.dart';
import 'user_repository.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserStarting()) {
    on<AppStarted>((event, emit) async{
      try {
            emit(UserLoading(message: "Getting users..."));
            await Future.delayed(const Duration(seconds: 2));
            //TODO para simular quen se tarda
            List<User> users = await userRepository.getUsersLocal();
            users.isEmpty ?  await userRepository.getUsers(): users;
            emit(FindUsers(users: users));
          } catch (error) {
            emit(UserFailure(error: error.toString()));
          }
    });
  }
}
