import 'dart:convert';
import 'package:http/http.dart';
import 'package:prueba_ingreso/helpers/helper.dart';
import 'package:prueba_ingreso/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      SharedPreferences storage = await SharedPreferences.getInstance();
      String usersLocalString = storage.getString("users")??"";
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

  Future<void> saveUsersLocal({required List<User> users}) async{ 
     try {
      SharedPreferences storage = await SharedPreferences.getInstance();
      await storage.setString("users", json.encode(Helper.encondeToJson(users)));
    } catch (error) {
      return Future.error(error);
    }
  }
}
