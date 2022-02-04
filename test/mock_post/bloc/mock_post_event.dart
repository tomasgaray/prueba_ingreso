import 'package:equatable/equatable.dart';

abstract class MockPostEvent extends Equatable {
  const MockPostEvent();

  @override
  List<Object> get props => [];
}

class GetPostByUserId extends MockPostEvent {
  final int userId;
  const GetPostByUserId({required this.userId});
}
