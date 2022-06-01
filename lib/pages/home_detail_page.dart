// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Mytheme.creamcolor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl4.red800.make(),
                  ElevatedButton(
                    onPressed: (){}, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Mytheme.darkBluishcolor),
                      shape: MaterialStateProperty.all(StadiumBorder(),),
                    ),
      
                    
                    child: "Buy".text.make(),
                    ).wh(100, 50)
                ],
        ).p24(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image).centered().h32(context)),
            Expanded(
                child: VxArc(
              height: 30,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,

              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(children: [
                  catalog.name.text.xl4
                      .color(Mytheme.darkBluishcolor)
                      .bold
                      .make(),
                  catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                  10.heightBox
                ]).py64()
              ),
            ))
          ],
        ),
      ),
    );
  }
}
