import 'package:flutter/material.dart';
import 'package:flutter_advanced2/model/login.dart';
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
      body: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 50, top: MediaQuery.of(context).size.width*0.25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    height: MediaQuery.of(context).size.width*0.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/img.png"),
                            fit: BoxFit.none
                        )
                    ),
                  ),
                  Text("Welcome back!", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold,),),
                  // SizedBox(height: 10,),
                  Text("Log in to your existant account of Q Allure", style: TextStyle(color: Colors.grey),),
                  // SizedBox(height: 30,),
                  Container(
                    height: 60,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            width: 1,
                            color: Colors.blue
                        )
                    ),
                    child: TextField(
                      controller: loginController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person_outline),
                          hintText: "Login",
                          hintStyle: TextStyle(color: Colors.grey)
                      ),
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          width: 1,
                          color: Colors.blue,
                        )
                    ),
                    child: TextField(
                      controller: passController,
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock_open_outlined),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  // SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forgot Password?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
                    ],
                  ),
                  // SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue
                    ),
                    child: TextButton(
                      onPressed: (){
                        // setState(() {
                        //   login = loginController.text.toString();
                        //   pass = passController.text.toString();
                        //   var user = User(login, pass);
                        //   PrefService.storeUser(user);
                        //   PrefService.loadUser().then((value) => {
                        //     value.toString()
                        //   });
                        //
                        //   print(login);
                        //   print(pass);
                        // });
                      },
                      child: Text("LOG IN", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  // SizedBox(height: 60,),
                  Text("Or connect using", style: TextStyle(color: Colors.grey, fontSize: 18),),
                  // SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 35,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: TextButton(
                          onPressed: (){},
                          child: Text("Facebook", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        height: 35,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: TextButton(
                          onPressed: (){},
                          child: Text("Google", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have a account?"),
                TextButton(onPressed: (){}, child: Text("Sign Up"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
