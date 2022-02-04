import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends UserEvent {
  const AppStarted();
}
class GetLocalUsers extends UserEvent {}
class UpdateLocalUsers extends UserEvent {
  const UpdateLocalUsers();
}
class SearchUserByName extends UserEvent {
  final String name;
  const SearchUserByName({required this.name});
}