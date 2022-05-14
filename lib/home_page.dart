import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 45;
    var arr = "its my first app";
    var fu = 2.14;
    double s = 3.14;
    return Scaffold(
      appBar: AppBar(
        title: Text("Catlog app"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days $arr  flutter $fu"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
