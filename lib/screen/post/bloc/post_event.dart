import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class GetPostByUserId extends PostEvent {
  final int userId;
  const GetPostByUserId({required this.userId});
}
