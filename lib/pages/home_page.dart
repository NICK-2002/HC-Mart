// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/utilis/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 0));
    final catalogJson =
        await rootBundle.loadString("assests/files/catalog.json");
    
    //By http
    //final response = await http.get(Uri.parse(url));
    //final catalogJson = response.body;
    print(catalogJson);
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(

        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          // ignore: prefer_const_literals_to_create_immutables
          mutations: {AddMutation, RemoveMutation},
          builder: (ctx, _,VxStatus) => FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, Myroutes.cartRoute),
              // ignore: deprecated_member_use
              backgroundColor: context.theme.buttonColor,
              child: Icon(
                CupertinoIcons.cart,
                color: Colors.white,
              )).badge(
              color: Vx.purple600,
              size: 22,
              count: _cart.items.length,
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  catalogHeader(),
                  if (CatalogModel.items != null &&
                      CatalogModel.items.isNotEmpty)
                    CatalogList().py16().expand()
                  else
                    CircularProgressIndicator().centered().expand(),
                ]),
          ),
        ),
        drawer: Drawer(),
        );
  }
}
