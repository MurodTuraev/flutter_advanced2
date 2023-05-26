import 'package:flutter/material.dart';
import 'package:flutter_advanced2/model/login.dart';
import 'package:flutter_advanced2/model/register.dart';
import 'package:flutter_advanced2/sevice/prefs_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static final String id = "register_page";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  final conpassController = TextEditingController();
  var _fullnameController;
  var _emailController;
  var _phoneController;
  var _passController;
  var _conpassController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30, bottom: 50, left: 20, right: 20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back, size: 30,))
                    ],
                  ),
                  Text("Let`s Get Started!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text("Create an account to Q Allure to get all features", style: TextStyle(color: Colors.grey, fontSize: 16),),
                  SizedBox(height: 20,),
                  Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.blue,
                            width: 2
                        )
                    ),
                    child: TextField(
                      controller: fullnameController,
                      style: TextStyle(color: Colors.blue, fontSize: 20,),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person_outline,),
                          hintText: "Fullname",
                          hintStyle: TextStyle(color: Colors.grey,)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.blue,
                            width: 2
                        )
                    ),
                    child: TextField(
                      controller: emailController,
                      style: TextStyle(color: Colors.blue, fontSize: 20,),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.mail_outline,),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey,)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.blue,
                            width: 2
                        )
                    ),
                    child: TextField(
                      controller: phoneController,
                      style: TextStyle(color: Colors.blue, fontSize: 20,),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.phone_android_outlined,),
                          hintText: "Phone",
                          hintStyle: TextStyle(color: Colors.grey,)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.blue,
                            width: 2
                        )
                    ),
                    child: TextField(
                      controller: passController,
                      style: TextStyle(color: Colors.blue, fontSize: 20,),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock_open_outlined,),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey,)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.blue,
                            width: 2
                        )
                    ),
                    child: TextField(
                      controller: conpassController,
                      style: TextStyle(color: Colors.blue, fontSize: 20,),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock_open_outlined,),
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(color: Colors.grey,)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue
                    ),
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          _fullnameController = fullnameController.text.toString();
                          _emailController = emailController.text.toString();
                          _phoneController = phoneController.text.toString();
                          _passController = passController.text.toString();
                          _conpassController = conpassController.text.toString();
                          var createuser = CreateUser(
                              _fullnameController,
                              _emailController,
                              _phoneController,
                              _passController,
                              _conpassController
                          );


                          PrefService.storeUser(createuser);
                          PrefService.loadUser().then((value) => {
                            value.toString()
                          });
                          print(_fullnameController);
                          print(_emailController);
                          print(_phoneController);
                          print(_passController);
                          print(_conpassController);
                        });
                      },
                      child: Text("CREATE", style: TextStyle(color: Colors.white, fontSize: 20),),
                    ),
                  )
                ],
              ),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(onPressed: (){

                }, child: Text("Login here"),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
