import 'package:equatable/equatable.dart';
import 'package:prueba_ingreso/models/user/user.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserStarting extends UserState {}

class UserLoading extends UserState {
  final String message;
  UserLoading({this.message = "Loading..."});
}

class FindUsers extends UserState {
  final List<User> users;
  FindUsers({required this.users});
}
class ListEmpty extends UserState {
  ListEmpty();
}

class UserFailure extends UserState {
  final String? error;
  UserFailure({required this.error});
}
