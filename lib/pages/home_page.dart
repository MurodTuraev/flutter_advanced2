import 'package:flutter/material.dart';
import 'package:flutter_advanced2/model/login.dart';
import 'package:flutter_advanced2/pages/register_page.dart';
import 'package:flutter_advanced2/sevice/gs_service.dart';
import 'package:flutter_advanced2/sevice/prefs_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var login;
  var pass;
  final loginController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(30),
        color: Colors.deepPurple.shade900,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height/7,),
                  Container(
                    height: MediaQuery.of(context).size.width/6,
                    width: MediaQuery.of(context).size.width/6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("assets/images/img.png"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Welcome Back!", style: TextStyle(fontSize: 30, color: Colors.grey, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text("Sign in to continue", style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),),
                  SizedBox(height: MediaQuery.of(context).size.height/18,),
                  TextFormField(
                    controller: loginController,
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline, color: Colors.grey, size: 25,),
                        label: Text("User Name", style: TextStyle(color: Colors.grey,fontSize: 20),),
                        border: UnderlineInputBorder()
                    ),
                  ),
                  TextFormField(
                    controller: passController,
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_open_outlined, color: Colors.grey, size: 25,),
                        label: Text("Password", style: TextStyle(color: Colors.grey,fontSize: 20),),
                        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  Text("Forgot password?", style: TextStyle(color:Colors.grey),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.blue
                    ),
                    child: IconButton(
                      onPressed: (){
                        setState(() {
                          login = loginController.text;
                          pass = passController.text;
                          var user = User(login, pass);
                          GetService.storeUser(user);
                          print(GetService.loadUser().toJson());
                        });
                      },
                      icon: Icon(Icons.arrow_forward,size: 40,color: Colors.white,),
                    ),
                  )
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don`t have an account?", style: TextStyle(color: Colors.grey),),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, RegisterPage.id);
                }, child: Text("SIGN UP"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
