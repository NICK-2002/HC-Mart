import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/welcome.dart';
import 'package:flutter_application_1/provider/google_sign_in.dart';
import 'package:flutter_application_1/utilis/routes.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  get darkTheme => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        // home: Homepage(),
        themeMode: ThemeMode.system,
        theme: Mytheme.lightTheme(context),
        //theme: ThemeData(primarySwatch: Colors.orange),

        darkTheme: Mytheme.darkTheme(context),

        debugShowCheckedModeBanner: false,
        initialRoute: Myroutes.welcomeRoute,
        routes: {
          "/": (context) => LoginPage(),
          Myroutes.homeRoute: (context) => Homepage(),
          Myroutes.loginRoute: (context) => LoginPage(),
          Myroutes.cartRoute: (context) => CartPage(),
          Myroutes.welcomeRoute: (context) => WelcomePage(),
        },
      ));
}
