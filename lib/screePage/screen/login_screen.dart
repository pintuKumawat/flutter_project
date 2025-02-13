import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_sign_task/blocs/log_in_bloc.dart';
import 'package:login_sign_task/screePage/Screen/registration_screen.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(
          children: [
            Center(
              child: Container(
                height: 170,
                width: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/coffecup-removebg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              // width: double.maxFinite,

              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    const Center(
                        child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Text(
                        "Welcome to ma Bakery please login your account \n using mobile number",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13, color: Colors.grey.shade600),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          borderRadius:
                              BorderRadius.circular(11), // Rounded corners
                        ),
                        child: Consumer<LogInBloc>(
                            builder: (contex, LogInBloc, child) {
                          return TextFormField(
                            maxLength: 10,

                            controller: phoneController,
                            keyboardType: TextInputType.phone,

                            validator: LogInBloc.logInValidation,


                            decoration: InputDecoration(
                              counterText: "",
                              filled: true,
                              // Enables the background color
                              fillColor: Colors.transparent,
                              // Background color is handled by Container
                              // hintText: 'Enter mobile number',
                              label: Text(
                                "Enter mobile number",
                                style: TextStyle(
                                  color: Colors.brown.shade700,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              // suffixIcon: Icon(
                              //   Icons.phone,
                              //   color: Colors.grey.shade500,
                              // ),
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border:
                                  InputBorder.none, // Removes default border
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: GestureDetector(
                        onTap: () {
                          if (!_formKey.currentState!.validate()) {
                            print("something is wrong");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  const Text("Please enter valid mobile number "),
                              backgroundColor: Colors.red.shade500,
                            ));

                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ));
                          }
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.brown, // Background color
                            borderRadius:
                                BorderRadius.circular(11), // Rounded corners
                          ),
                          child: Center(
                              child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
