import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:prueba_ingreso/helpers/helper.dart';
import 'package:prueba_ingreso/models/user/user.dart';
import '../../../environment.dart';
class UserRepository {
  Future<List<User>> getUsers() async {
    try {
      String ruta = "${environment.uriBase}/users";
      Uri uri = Uri.parse(ruta);
      Response res = await get(uri).timeout(const Duration(seconds: 120));
      if (res.statusCode == 200) {
        Iterable l = json.decode(res.body);
        var listUsers = (l as List).map((e) => User.deserialize(e)).toList();
        await saveUsersLocal(users:listUsers);
        return listUsers;
      }else {
        return Future.error(Helper.validateHttpCode(res));
      }
    } catch (error) {
      return Future.error(Helper.catchError(error));
    }
  }
  

  Future<List<User>> getUsersLocal()async{
    try {
      var box = await Hive.openBox('theDb');
      String usersLocalString = box.get("users")??"";
      if (usersLocalString != "") {
         Iterable l = json.decode(usersLocalString);
        var listUsers = (l as List).map((e) => User.deserialize(e)).toList();
        return listUsers;
      }
      return [];
    } catch (error) {
      return Future.error(Helper.catchError(error));
    }
  }
  Future<List<User>> searchUserByName({required String name})async{
    try {
      name = name.toLowerCase();
      List<User> localUsers = await getUsersLocal();
      var searchUsers = localUsers.where((element) => (element.name??"").toLowerCase().contains(name)).toList();
      return searchUsers;
    } catch (error) {
      return Future.error(Helper.catchError(error));
    }
  }

  Future<void> saveUsersLocal({required List<User> users}) async{ 
     try {
      var box = await Hive.openBox('theDb');
      box.put('users', json.encode(Helper.encondeToJson(users)));
    } catch (error) {
      return Future.error(error);
    }
  }
}
