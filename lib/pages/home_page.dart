// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:firstapp/core/store.dart';
import 'package:firstapp/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:firstapp/models/catalog.dart';

import '../utils/my_routes.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_item.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;

    final catalogJson =
        await rootBundle.loadString("assests/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    final productData = decodeData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            const CatalogHeader().pOnly(right: 200),
            if (CatalogModel.items.isNotEmpty)
              const CatalogList().expand()
            else
              const Center(
                child: CircularProgressIndicator(),
              ).expand()
          ],
        )),
      ),
      floatingActionButton: VxBuilder(
        mutations: const  {AddMutation, RemoveMutation},
        builder: (context,_, VxStatus) {
          return FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: context.theme.splashColor,
            child: const Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(
            color : Vx.gray200,
            size: 22,
            count: _cart!.items.length,
            textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            )
          );
        }
      ),
    );
  }
}
