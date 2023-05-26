import 'package:flutter/material.dart';
import 'package:flutter_advanced2/pages/home_page.dart';
import 'package:flutter_advanced2/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterPage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        RegisterPage.id: (context) => RegisterPage()
      },
    );
  }
}
