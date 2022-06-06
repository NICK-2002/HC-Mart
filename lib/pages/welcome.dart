// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: Form(
        child: Column(children: [
          SizedBox(height: 120),
          FlutterLogo(size: 120),
          SizedBox(height: 70),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Hey There, \nWelcome Back",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Login to your Account to continue",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: context.theme.buttonColor,
                onPrimary: Colors.white,
                minimumSize: Size(350, 50)),
            icon: FaIcon(
              FontAwesomeIcons.google,
              color: Colors.white,
            ),
            label: Text('Sign up With Google'),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);

              provider.googleLogin();
            },
          ),
          SizedBox(
            height: 150,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: TextStyle(color: context.accentColor),
                  text: 'Already have an Account?',
                  children: [
                    TextSpan(
                        text: 'Log in',
                        style: TextStyle(decoration: TextDecoration.underline))
                  ]))
        ]),
      ),
    );
  }
}
