import 'package:flutter/material.dart';

openSnakeBar(BuildContext context, String? title){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title!)));
}