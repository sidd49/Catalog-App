// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firstapp/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:firstapp/widgets/home_widgets/catalog_image.dart';

import '../models/catalog.dart';
import '../widgets/themes.dart';

class ItemDetailsPage extends StatelessWidget {
  final Item catalog;
  const ItemDetailsPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.cardColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child:  ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price.toString()}".text.bold.xl3.red800.make(),
                  AddToCart(catalog: catalog,).wh(100, 50)
                      
                ],
              ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Image.network(catalog.image).centered(),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY, 
                edge: VxEdge.TOP,
                child: 
                  Container(
                    color: context.theme.canvasColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl3.color(context.accentColor).bold.textStyle(context.captionStyle).make(),
                        catalog.desc.text.textStyle(context.captionStyle).make(),
                        10.heightBox,
                        "Dolor sea takimata ipsum sea eirmod aliquyam est. Eos ipsum voluptua eirmod elitr, no dolor dolor amet eirmod dolor labore dolores magna. Amet vero vero vero kasd, dolore sea sed sit invidunt nonumy est sit clita. Diam aliquyam amet tempor diam no aliquyam invidunt. Elitr lorem eirmod dolore clita. Rebum."
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .p16()
                        
                      ],
                    ).py64(),
                  )
              ),
            )
          ],
        ),
      )
    );
  }
}
