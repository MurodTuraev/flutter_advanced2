import 'package:flutter/material.dart';
import 'package:flutter_advanced2/model/login.dart';
import 'package:flutter_advanced2/pages/login/sign_up.dart';
import 'package:flutter_advanced2/sevice/gs_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static final String id = "sign_in";

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var login;
  var pass;
  final loginController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 127, 123, 1),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top: 60, bottom: 50, left: 50, right: 30),
            color: const Color.fromRGBO(7, 127, 123, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: AssetImage('assets/images/img.png'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                SizedBox(height: 20,),
                Text("Welcome", style: TextStyle(color: Color.fromRGBO(36, 161, 157, 1),fontSize: 22),),
                Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50),),
                color: Colors.white,
              ),
              padding: EdgeInsets.only(left: 50,right: 50, top: 30, bottom: 10),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: loginController,
                          decoration: InputDecoration(
                              label: Text("Email", style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold),)
                          ),
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        TextFormField(
                          controller: passController,
                          decoration: InputDecoration(
                              label: Text("Password", style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold),)
                          ),
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        TextButton(onPressed: (){}, child: Text("Forgot Password?")),
                        SizedBox(height: 10,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(7, 127, 123, 1)
                          ),
                          child: TextButton(
                            onPressed: (){
                              setState(() {
                                login = loginController.text;
                                pass = passController.text;
                                var user = User(login, pass);

                                GetService.storeUser(user);
                                print(GetService.loadUser());
                              });
                            },
                            child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 20),),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text("OR", style: TextStyle(fontSize: 20, color: Colors.black54),),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                icon: FaIcon(FontAwesomeIcons.facebook),
                                onPressed: (){},
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: FaIcon(FontAwesomeIcons.twitter),
                                onPressed: (){},
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: FaIcon(FontAwesomeIcons.instagram),
                                onPressed: (){print("insta pressed");},
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
                      Text("Don`t have an account?"),
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, SignUp.id);
                      }, child: Text("SignUp"))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
