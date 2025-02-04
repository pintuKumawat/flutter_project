import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RegistrationBloc extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;



  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  String? _errorCode;
  String? get errorCode => _errorCode;

  bool _hasError = false;
  bool get hasError => _hasError;



  String? validate(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your name';
      // _userName=ValidationItem(value,"Please Enter your name");
    } else if (value.length < 3) {
      return 'Name should be at least 3 character';
      // _userName=ValidationItem("","Name should be at least 3 character");
    }
    notifyListeners();
    return null;
  }

  //for mail validation

  String? emailValidate(String?value) {
    if (value!.isEmpty) {
      return 'Please enter your mail';
      // _email=ValidationItem(value,"Please Enter your mail");
    }
    else if (!RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      return 'Please enter you valid email address';
      // _email=ValidationItem("","Please Enter your valid mail");

    }
    notifyListeners();
    return null;
  }

  //for mobile number validation

  String? mobileValidate(String?value) {
    if (value!.isEmpty) {
      return 'Please enter your phone number';
      // _phone=ValidationItem(value,"Please Enter your phone number");

    }
    else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter your valid mobile number';
      // _phone=ValidationItem("","Please Enter your valid phone number");


    }
    notifyListeners();
    return null;
  }

// for password validation

  String? passwordValidate(String?value) {
    if (value!.isEmpty) {
      return "Please enter your password";
      // _password =ValidationItem(value, "Please enter your password");
    }


    else if (!RegExp(r"^(?=.*[A-Za-z])(?=.*\d).{8,}$").hasMatch(value)) {
      return 'Password should be at least 8 character';
      // _password =ValidationItem("", "Please enter your valid password");

    }
    notifyListeners();
    return null;
  }


// for obscure text
  bool _isShowPassword = true;

  bool get isShowPassword => _isShowPassword;

  showPasswordChange() {
    _isShowPassword = !_isShowPassword;
    notifyListeners();
  }


  handleRegistration() {
    print(userNameController.text);
  }



  Future signUpwithEmailPassword() async {
    try {
      final User user = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user!;
      

      await user.getIdToken();
      print(user.getIdToken());
      

      _hasError = false;
      notifyListeners();
    } catch (e) {
      _hasError = true;
      _errorCode = e.toString();
      notifyListeners();
    }
  }

}
























