import 'package:flutter_advanced2/model/login.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService{
  static var box = Hive.box("first_data");

  static void storeUser(User user) async{
    box.put("user", user.toJson());
  }

  static User loadUser(){
    var user = User.fromJson(box.get('user'));
    return user;
  }

  static void removeUser() async{
    box.delete('user');
  }
}