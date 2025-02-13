import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_sign_task/screePage/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../blocs/registration_bloc.dart';
import 'login_screen.dart';





class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    afterSplash();

  }


  void afterSplash() async{

    Future.delayed(const Duration(seconds: 3));

    final SharedPreferences pref= await SharedPreferences.getInstance();
    bool? isUserLogin = pref.getBool("isUserLogin") ?? false;
    // await pref.setString('userEmail', RegistrationBloc().emailController.text);
    // await pref.setString('userEmail', RegistrationBloc().passwordController.text);

    if(isUserLogin){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }



  }









  //
  // Future<void> checkUserStatus() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false; // Default false
  //
  //   Timer(Duration(seconds: 3), () {
  //     if (isLoggedIn) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => LoginScreen()),
  //       );
  //     } else {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => LoginScreen()),
  //       );
  //     }
  //   });
  // }

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
            child: const Image(image: AssetImage("assets/images/coffelogo-removebg.png")),
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