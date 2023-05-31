import 'package:flutter/material.dart';
import 'package:flutter_advanced2/model/register.dart';
import 'package:flutter_advanced2/pages/login/sign_in.dart';
import 'package:flutter_advanced2/sevice/gs_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static final String id = "sign_up";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var login;
  var phone;
  var address;
  final loginController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
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
                Text("Welcome", style: TextStyle(color: Color.fromRGBO(36, 161, 157, 1),fontSize: 22),),
                Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),)
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
                          controller: phoneController,
                          decoration: InputDecoration(
                              label: Text("Number", style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold),)
                          ),
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        TextFormField(
                          controller: addressController,
                          decoration: InputDecoration(
                              label: Text("Address", style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold),)
                          ),
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(7, 127, 123, 1)
                          ),
                          child: TextButton(
                            onPressed: (){
                              login = loginController.text;
                              phone = phoneController.text;
                              address = addressController.text;

                              var user = CreateUser(login, phone, phone, address, "12345");

                              GetService.createUser(user);
                              print(GetService.loadCreatedUser());
                            },
                            child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 20),),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("OR", style: TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
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
                      Text("Already have an account?"),
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, SignIn.id);
                      }, child: Text("SignIn"))
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
