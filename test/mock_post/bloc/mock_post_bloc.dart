import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_ingreso/models/post.dart';

import 'mock_post_event.dart';
import 'mock_post_repository.dart';
import 'mock_post_state.dart';
class MockPostBloc extends Bloc<MockPostEvent, MockPostState> {
  final MockPostRepository mockPostRepository;

  MockPostBloc(this.mockPostRepository)  : super(PostStarting()) {
    on<GetPostByUserId>((event, emit) async{
      try {
        emit(PostLoading(message: "Obteniendo publicaciones..."));
        List<Post> posts = await mockPostRepository.getPostByUserId(userId: event.userId);
        posts.isEmpty ? emit(ListEmptyPosts()):emit(FindPosts(posts: posts));
      } catch (error) {
        emit(PostFailure(error: error.toString()));
      }
    });
  }
}
