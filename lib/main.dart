import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced2/pages/create_page.dart';
import 'package:flutter_advanced2/pages/home_page.dart';
import 'package:flutter_advanced2/pages/login/sign_in.dart';
import 'package:flutter_advanced2/pages/login/sign_up.dart';
import 'package:flutter_advanced2/pages/register_page.dart';
import 'package:flutter_advanced2/pages/signin_page.dart';
import 'package:flutter_advanced2/pages/signup_page.dart';
import 'package:flutter_advanced2/pages/splash_page.dart';
import 'package:flutter_advanced2/pages/work%20with%20http/network_page.dart';
import 'package:flutter_advanced2/pages/work%20with%20http/view_employee.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_advanced2/sevice/http_service.dart';

void main() async{
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String? name;
    int? salary=1;
    int? age=1;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        RegisterPage.id: (context) => RegisterPage(),
        SignUp.id: (context) => SignUp(),
        SignIn.id: (context) => SignIn(),
        // NetworkPage.id: (context) => NetworkPage(),
        // ViewEmp.id: (context) => ViewEmp(name!, salary, age),
        SignInPage.id: (context) => SignInPage(),
        SplashPage.id: (context) => SplashPage(),
        SignUpPage.id: (context) => SignUpPage(),
        CreatePage.id: (context) => CreatePage()
      },
    );
  }
}
