import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../blocs/registration_bloc.dart';
import 'otp_verify_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  // bool _isObscured =
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final validationService = Provider.of<RegistrationBloc>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey.shade200,
            child: Form(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formkey,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 170,
                      width: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/coffecup-removebg.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.brown,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            child: Text(
                              "Welcome to ma Bakery please create your account",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: Consumer<RegistrationBloc>(
                                builder: (context, registrationBloc, child) {
                                  return TextFormField(
                                    keyboardType: TextInputType.text,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller:
                                        registrationBloc.userNameController,
                                    validator: registrationBloc.validate,
                                    decoration: InputDecoration(
                                      // errorText: "error",
                                      suffixIcon: Icon(
                                        Icons.person_outline,
                                        color: Colors.grey.shade500,
                                      ),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      // hintText: 'Enter username',
                                      label: Text(
                                        "Enter user name",
                                        style: TextStyle(
                                          color: Colors.brown.shade700,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      // errorText: validationService.userName.error,

                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade500),
                                      border: InputBorder.none,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color
                                borderRadius: BorderRadius.circular(
                                    11), // Rounded corners
                              ),
                              child: Consumer<RegistrationBloc>(
                                  builder: (context, registrationBloc, child) {
                                return TextFormField(
                                  // maxLength: 10,
                                  controller: registrationBloc.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: registrationBloc.emailValidate,
                                  // onChanged: (String value){
                                  //    validationService.emailValidate(value);
                                  // },

                                  // onChanged: (value) {
                                  //   _formkey.currentState?.validate();
                                  // },
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return " Please enter your mail";
                                  //   } else if (!RegExp(
                                  //           r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                  //       .hasMatch(value)) {
                                  //     return 'Please enter valid email address';
                                  //   }
                                  // },

                                  decoration: InputDecoration(
                                    filled: true,
                                    // Enables the background color
                                    fillColor: Colors.transparent,
                                    // Background color is handled by Container
                                    // hintText: 'Enter email address',
                                    label: Text(
                                      "Enter email address",
                                      style: TextStyle(
                                        color: Colors.brown.shade700,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    // errorText: validationService.email.error,
                                    suffixIcon: Icon(
                                      Icons.mail,
                                      color: Colors.grey.shade500,
                                    ),

                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade500),
                                    border: InputBorder
                                        .none, // Removes default border
                                  ),
                                );
                              }),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color
                                borderRadius: BorderRadius.circular(
                                    11), // Rounded corners
                              ),
                              child: Consumer<RegistrationBloc>(
                                  builder: (context, registrationBloc, child) {
                                return TextFormField(
                                  maxLength: 10,
                                  keyboardType: TextInputType.phone,
                                  controller:
                                      registrationBloc.mobileNumberController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,

                                  validator: registrationBloc.mobileValidate,
                                  //     onChanged: (String value){
                                  //       validationService.mobileValidate(value);
                                  //     },

                                  // onChanged: (value) {
                                  //   _formkey.currentState?.validate();
                                  // },
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return 'Enter your phone number';
                                  //   } else if (!RegExp(r'^[0-9]{10}$')
                                  //       .hasMatch(value)) {
                                  //     return "Please Enter valid phone name ";
                                  //   }
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
                                    // errorText: validationService.phone.error,
                                    suffixIcon: Icon(
                                      Icons.phone,
                                      color: Colors.grey.shade500,
                                    ),
                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade500),
                                    border: InputBorder
                                        .none, // Removes default border
                                  ),
                                );
                              }),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color
                                borderRadius: BorderRadius.circular(
                                    11), // Rounded corners
                              ),
                              child: Consumer<RegistrationBloc>(
                                  builder: (context, registrationBloc, child) {
                                return TextFormField(
                                  controller:
                                      registrationBloc.passwordController,
                                  obscureText: registrationBloc.isShowPassword,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: registrationBloc.passwordValidate,
                                  // onChanged: (String value){
                                  //   validationService.passwordValidate(value);
                                  // },

                                  // onChanged: (value) {
                                  //   _formkey.currentState?.validate();
                                  // },
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return " Please Enter your password";
                                  //   } else if (!RegExp(
                                  //           r"^(?=.*[A-Za-z])(?=.*\d).{8,}$")
                                  //       .hasMatch(value)) {
                                  //     return 'Minimum 8 Characters, At Least One Letter and One Number';
                                  //   }
                                  // },
                                  decoration: InputDecoration(
                                    filled: true,
                                    border: InputBorder.none,
                                    fillColor: Colors.transparent,
                                    // Background color is handled by Container
                                    // hintText: 'Enter password',
                                    label: Text(
                                      "Enter your password",
                                      style: TextStyle(
                                        color: Colors.brown.shade700,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    // errorText: validationService.password.error,

                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade500),

                                    suffixIcon: IconButton(
                                        icon: Icon(
                                          registrationBloc.isShowPassword
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey.shade500,
                                        ),
                                        onPressed: () => registrationBloc
                                            .showPasswordChange()),
                                  ),
                                );
                              }),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Consumer<RegistrationBloc>(
                              builder: (context, registrationBloc, child) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              child: GestureDetector(
                                // onTap: () {
                                //   if (!_formkey.currentState!.validate()) {
                                //     print("something is wrong");
                                //     ScaffoldMessenger.of(context)
                                //         .showSnackBar(SnackBar(
                                //       content:
                                //           Text("Please enter valid detais "),
                                //       backgroundColor: Colors.red.shade500,
                                //     ));
                                //   } else {
                                //     registrationBloc.handleRegistration();
                                //     Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //           builder: (context) =>
                                //               OtpVerifyScreentp(),
                                //         ));
                                //   }
                                // },

                                onTap: () async {
                                  try {
                                    await registrationBloc
                                        .signUpwithEmailPassword()
                                        .then((value) => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    OtpVerifyScreentp(),
                                              )));
                                  } catch (e) {
                                    ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content:
                                              Text("Please enter valid detais "),
                                          backgroundColor: Colors.red.shade500,
                                        ));
                                  }
                                },
                                child: Container(
                                  height: 45,
                                  child: Center(
                                      child: Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  )),
                                  decoration: BoxDecoration(
                                    color: Colors.brown,
                                    // Background color
                                    borderRadius: BorderRadius.circular(
                                        11), // Rounded corners
                                  ),
                                ),
                              ),
                            );
                          })
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
