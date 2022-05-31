// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../models/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 0));
    final catalogJson =
        await rootBundle.loadString("assests/files/catalog.json");
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          // ignore: unnecessary_null_comparison
          child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, Index) {
                    final item = CatalogModel.items[Index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(10) ),
                      child: GridTile(
                        header: Container(
                          child: Text(
                            item.name,
                            style: TextStyle(color: Colors.white),),
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                            )
                        ),
                        child: Image.network(item.image),
                        footer: Container(
                          child: Text(
                            item.price.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.grey,
 ),
                        ),
                        ));
                  },
                  itemCount: CatalogModel.items.length,
                )
                /*
                ListView.builder(
                  itemCount: CatalogModel.items.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(
                      item: CatalogModel.items[index],
                    );
                  },
                )
                */
              : Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: Mydrawer(),
    );
  }
}
