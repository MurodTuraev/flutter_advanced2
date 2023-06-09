import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_advanced2/pages/home_page.dart';
import 'package:flutter_advanced2/pages/signin_page.dart';
import 'package:flutter_advanced2/sevice/auth_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static final String id = 'splash_page';
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initTimer();
  }

  void _initTimer(){
    Timer(const Duration(seconds: 2),(){
      _callNextPage();
    });
  }

  _callNextPage(){
    if(AuthService.isLogged()){
      Navigator.pushReplacementNamed(context, SignInPage.id);
    }else{
      Navigator.pushReplacementNamed(context, HomePage.id);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(193, 53, 132, 1),
              Color.fromRGBO(131, 58, 180, 1),
            ]
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Center(
                child: Text("Welcome", style: TextStyle(color: Colors.white,fontSize: 35),),
              ),
            ),
            Text("All right reseved", style: TextStyle(color: Colors.white,fontSize: 16),),
            SizedBox(height: 15,)
          ],
        ),
      ),
    );
  }
}
