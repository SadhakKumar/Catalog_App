import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/utills/routes.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';
import 'package:flutter_application_1/widgets/themes.dart';

import '../widgets/homepage_widgets/catalog_header.dart';
import '../widgets/homepage_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeedData = jsonDecode(catalogJson);
    var productData = decodeedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {
      print("this is setstate");
    });
  }

  @override
  // Widget build(BuildContext context) {
  //   var days = 10;
  //   return Scaffold(
  //     appBar: AppBar(
  //       // backgroundColor: Colors.deepPurple,
  //       centerTitle: true,

  //       title: Text(
  //         "Catalog App",
  //         style: TextStyle(fontSize: 16),
  //       ),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       // child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
  //       //     ? ListView.builder(
  //       //         itemCount: CatalogModel.items.length,
  //       //         itemBuilder: (context, index) {
  //       //           return ItemWidget(
  //       //             item: CatalogModel.items[index],
  //       //           );
  //       //         },
  //       //       )
  //       //     : Center(
  //       //         child: CircularProgressIndicator(),
  //       //       ),
  //       child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
  //           ? GridView.builder(
  //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                   crossAxisCount: 2,
  //                   crossAxisSpacing: 16,
  //                   mainAxisSpacing: 16),
  //               itemBuilder: (context, index) {
  //                 final item = CatalogModel.items[index];
  //                 return Card(
  //                   clipBehavior: Clip.antiAlias,
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                   child: GridTile(
  //                     header: Container(
  //                       child: Text(
  //                         item.name,
  //                         style: TextStyle(color: Colors.white),
  //                       ),
  //                       decoration: BoxDecoration(
  //                         color: Colors.deepPurple,
  //                       ),
  //                     ),
  //                     child: Image.network(item.image),
  //                     footer: Text("\$${item.price.toString()}"),
  //                   ),
  //                 );
  //               },
  //               itemCount: CatalogModel.items.length,
  //             )
  //           : Center(
  //               child: CircularProgressIndicator(),
  //             ),
  //     ),
  //     drawer: MyDrawer(),
  //   );
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        backgroundColor: MyTheme.darkBlueish,
        child: Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHeader(),
                  if (CatalogModel.items != null &&
                      CatalogModel.items.isNotEmpty)
                    Expanded(child: CatalogList())
                  else
                    Expanded(child: Center(child: CircularProgressIndicator()))
                ],
              ))),
    );
  }
}
