import 'package:equatable/equatable.dart';
import 'package:prueba_ingreso/models/user/user.dart';

abstract class MockUserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserStarting extends MockUserState {}

class UserLoading extends MockUserState {
  final String message;
  UserLoading({this.message = "Loading..."});
}

class FindUsers extends MockUserState {
  final List<User> users;
  FindUsers(this.users);
}
class ListEmpty extends MockUserState {
  ListEmpty();
}


class UserFailure extends MockUserState {
  final String? error;
  UserFailure({required this.error});
}
