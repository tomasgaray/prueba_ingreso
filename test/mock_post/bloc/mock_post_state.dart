import 'package:equatable/equatable.dart';
import 'package:prueba_ingreso/models/post.dart';

abstract class MockPostState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostStarting extends MockPostState {}

class PostLoading extends MockPostState {
  final String message;
  PostLoading({this.message = "Loading..."});
}

class FindPosts extends MockPostState {
  final List<Post> posts;
  FindPosts({required this.posts});
}
class ListEmptyPosts extends MockPostState {
  ListEmptyPosts();
}

class PostFailure extends MockPostState {
  final String? error;
  PostFailure({required this.error});
}
