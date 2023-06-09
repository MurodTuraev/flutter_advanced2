import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced2/pages/home_page.dart';
import 'package:flutter_advanced2/pages/signin_page.dart';
import 'package:flutter_advanced2/sevice/auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static final String id = 'signup_page';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();



  _doSignUp(){
    String name = nameController.text;
    String email = emailController.text;
    String pass = passController.text;

    AuthService.signUpUser(name, email, pass).then((value) => {
      responseSignUp(value!),
    });
  }

  void responseSignUp(User firebaseUser){
    Navigator.pushReplacementNamed(context, HomePage.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.white54.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(7)
              ),
              child: TextFormField(
                controller: nameController,
                style: TextStyle(color: Colors.black54),
                decoration: InputDecoration(
                    hintText: "Fullname",
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    hintStyle: TextStyle(fontSize: 17, color: Colors.grey)
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.white54.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(7)
              ),
              child: TextFormField(
                controller: emailController,
                style: TextStyle(color: Colors.black54),
                decoration: InputDecoration(
                    hintText: "Email",
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    hintStyle: TextStyle(fontSize: 17, color: Colors.grey)
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.white54.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(7)
              ),
              child: TextFormField(
                controller: passController,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    hintText: "Password",
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    hintStyle: TextStyle(fontSize: 17, color: Colors.grey)
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(7)
              ),
              child: TextButton(
                onPressed: (){
                  _doSignUp();
                },
                child: Text("Sign Up",style: TextStyle(color: Colors.white, fontSize: 20),),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?", style: TextStyle(color: Colors.black,fontSize: 16),),
                TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, SignInPage.id);
                  },
                  child: Text("Sign In", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
