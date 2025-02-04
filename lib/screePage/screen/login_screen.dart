import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_sign_task/blocs/log_in_bloc.dart';
import 'package:login_sign_task/screePage/Screen/registration_screen.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/coffecup-removebg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // width: double.maxFinite,

              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Center(
                        child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
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
                    SizedBox(
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
                            // onChanged: (value) {
                            //   _formKey.currentState?.validate();
                            // },
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return "Please enter your phone number";
                            //   } else
                            //   if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                            //     return "Please enter valid phone number";
                            //   }
                            //   return null;
                            // },

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
                    SizedBox(
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
                                  Text("Please enter valid mobile number "),
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
                          child: Center(
                              child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          )),
                          decoration: BoxDecoration(
                            color: Colors.brown, // Background color
                            borderRadius:
                                BorderRadius.circular(11), // Rounded corners
                          ),
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
