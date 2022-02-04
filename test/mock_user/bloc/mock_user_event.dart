import 'package:equatable/equatable.dart';

abstract class MockUserEvent extends Equatable {
  const MockUserEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends MockUserEvent {
  const AppStarted();
}

class SearchUserByName extends MockUserEvent {
  final String name;
  const SearchUserByName({required this.name});
}