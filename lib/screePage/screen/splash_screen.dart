import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';





class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();


    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.shade300,
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.grey.shade300,
            child: Image(image: AssetImage("assets/images/coffelogo-removebg.png")),
          ),
        ),
      ),
    );
  }
}







  // @override

  // void initState(){
  //   super.initState();
  //
  //   Timer(Duration(seconds: 2),(){
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginPage()),);
  //   });
  // }
//   Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.grey.shade300,
//
//      ),
//      body: Container(
//        width: double.maxFinite,
//        height: double.maxFinite,
//        color: Colors.grey.shade300,
//        child: Center(
//          child: Container(
//            width: 300,
//            height: 300,
//            color: Colors.grey.shade300,
//            child: Image(image: AssetImage("assets/images/coffelogo-removebg.png")),
//          ),
//        ),
//      ),
//    );
//   }
//
// }