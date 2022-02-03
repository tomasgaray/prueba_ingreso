import 'package:equatable/equatable.dart';
import 'package:prueba_ingreso/models/post.dart';

abstract class PostState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostStarting extends PostState {}

class PostLoading extends PostState {
  final String message;
  PostLoading({this.message = "Loading..."});
}

class FindPosts extends PostState {
  final List<Post> posts;
  FindPosts({required this.posts});
}

class PostFailure extends PostState {
  final String? error;
  PostFailure({required this.error});
}
