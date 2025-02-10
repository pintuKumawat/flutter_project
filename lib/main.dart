import 'package:flutter/material.dart';
import 'package:login_sign_task/blocs/log_in_bloc.dart';
import 'package:login_sign_task/blocs/registration_bloc.dart';
import 'package:login_sign_task/screePage/screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(providers: [
      ChangeNotifierProvider<RegistrationBloc>(create: (context)=>RegistrationBloc()),
       ChangeNotifierProvider<LogInBloc>(create: (context)=>LogInBloc()),
      
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen()
      ),
    );
  }
}
