
import 'package:flutter_advanced2/model/login.dart';
import 'package:flutter_advanced2/model/register.dart';
import 'package:get_storage/get_storage.dart';

class GetService{
  static var box = GetStorage();
  static void storeUser(User user) async{
    box.write("user", user.toJson());
  }

  static User loadUser(){
    var user = User.fromJson(box.read("user"));
    return user;
  }

  static var boxCreate = GetStorage();
  static void createUser(CreateUser user) async{
    boxCreate.write("user1", user.toJson());
  }
  static CreateUser loadCreatedUser(){
    var user = CreateUser.fromJson(boxCreate.read("user1"));
    return user;
  }
}