import 'package:flutter/material.dart';
import 'package:flutter_advanced2/sevice/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: TextStyle(fontSize: 25),),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 50,
          width: 200,
          color: Colors.red,
          child: TextButton(
            onPressed: (){
              AuthService.signOutUser(context);
            },
            child: Text("Logout", style: TextStyle(color: Colors.white, fontSize: 25),),
          ),
        ),
      ),
    );
  }
}
