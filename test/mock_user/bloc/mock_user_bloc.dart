import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_ingreso/models/user/user.dart';

import 'mock_user_event.dart';
import 'mock_user_repository.dart';
import 'mock_user_state.dart';

class MockUserBloc extends Bloc<MockUserEvent, MockUserState> {
  final MockUserRepository userRepository;

  MockUserBloc(this.userRepository) : super(UserStarting()) {
    on<AppStarted>((event, emit) async{
      try {
        emit(UserLoading(message: "Obteniendo Usuarios..."));
        List<User> users = await userRepository.getUsers();
        emit(FindUsers(users));
      }
      catch (error) {
        emit(UserFailure(error: error.toString()));
      }
    });

    on<SearchUserByName>((event, emit) async{
      try {
        emit(UserLoading(message: "Buscando usuario..."));
        List<User> users = await userRepository.searchUserByName(name:event.name);
        users.isEmpty ? emit(ListEmpty()): emit(FindUsers(users));
      }
      catch (error) {
        emit(UserFailure(error: error.toString()));
      }
    });
  }
}
