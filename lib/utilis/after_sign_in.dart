import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/welcome.dart';
import 'package:flutter_application_1/utilis/routes.dart';

class After_SignIn extends StatefulWidget {
  const After_SignIn({Key? key}) : super(key: key);

  @override
  State<After_SignIn> createState() => _After_SignInState();
}

bool changeButton = false;

final _formKey = GlobalKey<FormState>();

class _After_SignInState extends State<After_SignIn> {
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, Myroutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            else if (snapshot.hasData) {
              return moveToHome(context);
            } else if (snapshot.hasError)
              return Center(child: Text('Something went Wrong!'));
            else {
              return moveToHome(context);
            }
          },
        ),
      );
}
