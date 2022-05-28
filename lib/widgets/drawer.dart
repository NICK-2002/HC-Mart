// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    final urlImage =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHySWRP1px6umwhp72BsPMKmfqL2QjcGEfMQ&usqp=CAU";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Nikhil Singh"),
                  accountEmail: Text("nikhilsinghshekhawat6378@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(urlImage)),
                ),
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.home,
                    color: Colors.white,),
                    title: Text(
                      "Home",
                      textScaleFactor: 1.3,
                      style: TextStyle(
                        color: Colors.white
                      ),),
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.white,),
                    title: Text(
                      "Profile",
                      textScaleFactor: 1.3,
                      style: TextStyle(
                        color: Colors.white
                      ),),
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.mail,
                    color: Colors.white,),
                    title: Text(
                      "Contact Us",
                      textScaleFactor: 1.3,
                      style: TextStyle(
                        color: Colors.white
                      ),),
                      
                )
          ],
        ),
      ),
    );
  }
}
