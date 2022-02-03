import 'dart:convert';
import 'package:http/http.dart';
import 'package:prueba_ingreso/helpers/helper.dart';
import 'package:prueba_ingreso/models/post.dart';
import '../../../environment.dart';

class PostRepository {
Future<List<Post>> getPostByUserId({required int userId}) async {
    try {
      String ruta = "${environment.uriBase}/posts?userId=$userId";
      Uri uri = Uri.parse(ruta);
      Response res = await get(uri).timeout(const Duration(seconds: 120));
      if (res.statusCode == 200) {
        Iterable l = json.decode(res.body);
        var listPosts = (l as List).map((e) => Post.deserialize(e)).toList();
        return listPosts;
      }else {
        return Future.error(Helper.validateHttpCode(res));
      }
    } catch (error) {
      return Future.error(Helper.catchError(error));
    }
  }
}