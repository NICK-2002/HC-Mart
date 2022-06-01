
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';


class catalogHeader extends StatelessWidget {
  const catalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        "Catalog App".text.xl5.bold.color(Mytheme.darkBluishcolor).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}