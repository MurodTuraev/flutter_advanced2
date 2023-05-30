import 'package:flutter/material.dart';
import 'package:flutter_advanced2/model/login.dart';
import 'package:flutter_advanced2/model/register.dart';
import 'package:flutter_advanced2/pages/home_page.dart';
import 'package:flutter_advanced2/sevice/gs_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static final String id = 'register_page';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var login;
  var pass;
  var email;
  var phone;
  final loginController = TextEditingController();
  final passController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
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
                  SizedBox(height: MediaQuery.of(context).size.height/20,),
                  Text("Create", style: TextStyle(fontSize: 30, color: Colors.grey, fontWeight: FontWeight.bold),),
                  Text("Account", style: TextStyle(fontSize: 30, color: Colors.grey, fontWeight: FontWeight.bold),),
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
                    controller: emailController,
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail_outline, color: Colors.grey, size: 25,),
                        label: Text("E-Mail", style: TextStyle(color: Colors.grey,fontSize: 20),),
                        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
                    ),
                  ),
                  TextFormField(
                    controller: phoneController,
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_outlined, color: Colors.grey, size: 25,),
                        label: Text("Phone Number", style: TextStyle(color: Colors.grey,fontSize: 20),),
                        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
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
                          email = emailController.text;
                          phone = phoneController.text;
                          pass = passController.text;
                          var user = CreateUser(login, email, phone, pass, pass);
                          GetService.createUser(user);
                          print(GetService.loadCreatedUser());
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
                Text("Already have an account?", style: TextStyle(color: Colors.grey),),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, HomePage.id);
                }, child: Text("SIGN IN"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
