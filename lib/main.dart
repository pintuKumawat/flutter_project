import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_sign_task/blocs/log_in_bloc.dart';
import 'package:login_sign_task/screePage/Screen/login_screen.dart';
import 'package:login_sign_task/screePage/Screen/otp_verify_screen.dart';
import 'package:login_sign_task/screePage/Screen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'blocs/registration_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<RegistrationBloc>(create: (context) => RegistrationBloc()),
ChangeNotifierProvider<LogInBloc>(create: (context)=>LogInBloc(),)
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),

        // loginPage()
        // const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // TextEditingController passwordController = TextEditingController();
  // bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          title: BackButton(),
        ),
        body: Container(),
    );
  }
}
