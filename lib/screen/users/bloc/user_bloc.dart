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
        List<User> users = await userRepository.getUsersLocal();
        users.isEmpty ?  await userRepository.getUsers(): users;
        emit(FindUsers(users: users));
      }
      catch (error) {
        emit(UserFailure(error: error.toString()));
      }
    });

    on<SearchUserByName>((event, emit) async{
      try {
        emit(UserLoading(message: "Search user..."));
        List<User> users = await userRepository.searchUserByName(name:event.name);
        users.isEmpty ? emit(ListEmpty()): emit(FindUsers(users: users));
      }
      catch (error) {
        emit(UserFailure(error: error.toString()));
      }
    });
    on<UpdateLocalUsers>((event, emit) async{
      try {
        //Evitamos mostrar mensaje de cargando, porque esto solo esta actualizando los usuarios locales en segundo plano
        await userRepository.getUsers();
      }
      catch (error) {
        emit(UserFailure(error: error.toString()));
      }
    });

  }
}
