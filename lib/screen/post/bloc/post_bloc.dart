import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_ingreso/models/post.dart';
import '../../post/bloc/post_repository.dart';
import 'post_event.dart';
import 'post_state.dart';
class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository)  : super(PostStarting()) {
    on<GetPostByUserId>((event, emit) async{
      try {
        emit(PostLoading(message: "Obteniendo publicaciones..."));
        List<Post> posts = await postRepository.getPostByUserId(userId: event.userId);
        posts.isEmpty ? emit(ListEmptyPosts()):emit(FindPosts(posts: posts));
      } catch (error) {
        emit(PostFailure(error: error.toString()));
      }
    });
  }
}
