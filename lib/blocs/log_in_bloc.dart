import 'package:flutter/material.dart';

class LogInBloc extends ChangeNotifier {


  // for login screen validation

  String? logInValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter mobile number";
    }
    else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return "Please enter valid mobile number";
    }
    return null;
  }
}
