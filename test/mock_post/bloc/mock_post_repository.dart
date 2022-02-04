import 'package:prueba_ingreso/models/post.dart';

var mockPosts = <Post> [
  Post(id: 1, userId:7, title: "lorem", body: "lorem impu"),
  Post(id: 2, userId:7, title: "lorem", body: "lorem impu"),
  Post(id: 3, userId:7, title: "lorem", body: "lorem impu"),
  Post(id: 4, userId:6, title: "lorem", body: "lorem impu"),
  Post(id: 5, userId:5, title: "lorem", body: "lorem impu"),
  Post(id: 6, userId:1, title: "lorem", body: "lorem impu"),
  Post(id: 7, userId:4, title: "lorem", body: "lorem impu"),
  Post(id: 8, userId:3, title: "lorem", body: "lorem impu"),
  Post(id: 9, userId:3, title: "lorem", body: "lorem impu"),
];

class MockPostRepository {
Future<List<Post>> getPostByUserId({required int userId}) async {
    var posts =mockPosts.where((element) => element.userId == userId).toList();
    return posts;
  }
}