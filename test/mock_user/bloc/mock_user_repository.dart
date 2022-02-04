import 'package:prueba_ingreso/helpers/helper.dart';
import 'package:prueba_ingreso/models/user/user.dart';

var mockUsers = <User> [
  User(id: 1, name:"test 1",  userName: "test 1", email: "test1@gmail.com", phone:"+504 3344-4433", website: "test1.com"),
  User(id: 2, name:"test 2",  userName: "test 2", email: "test2@gmail.com", phone:"+504 3344-4434", website: "test2.com"),
  User(id: 3, name:"test 3",  userName: "test 3", email: "test3@gmail.com", phone:"+504 3344-4435", website: "test3.com"),
  User(id: 4, name:"test 4",  userName: "test 4", email: "test4@gmail.com", phone:"+504 3344-4436", website: "test4.com"),
  User(id: 5, name:"test 5",  userName: "test 5", email: "test5@gmail.com", phone:"+504 3344-4437", website: "test5.com"),
  User(id: 6, name:"test 6",  userName: "test 6", email: "test6@gmail.com", phone:"+504 3344-4438", website: "test6.com"),
  User(id: 7, name:"test 7",  userName: "test 7", email: "test7@gmail.com", phone:"+504 3344-4439", website: "test7.com"),
  User(id: 8, name:"test 8",  userName: "test 8", email: "test8@gmail.com", phone:"+504 3344-4431", website: "test8.com"),
  User(id: 9, name:"test 9",  userName: "test 9", email: "test9@gmail.com", phone:"+504 3344-4432", website: "test9.com")
];

class MockUserRepository {
  Future<List<User>> getUsers() async {
      return List<User>.from(mockUsers);
  }
  
  Future<List<User>> searchUserByName({required String name})async{
    try {
      name = name.toLowerCase();
      var searchUsers =  List<User>.from(mockUsers).where((element) => (element.name??"").toLowerCase().contains(name)).toList();
      return searchUsers;
    } catch (error) {
      return Future.error(Helper.catchError(error));
    }
  }
}
