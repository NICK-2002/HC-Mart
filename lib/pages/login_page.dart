import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text("Login Page",
        style: TextStyle(
          fontSize: 40 ,
          color: Colors.indigo,
          fontWeight: FontWeight.bold),
          textScaleFactor: 2.0,
        ),
      ),
    );
    
  }
}