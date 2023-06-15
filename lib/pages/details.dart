import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/homepage_widgets/add_to_cart.dart';
import 'package:flutter_application_1/widgets/themes.dart';

class DetailsPage extends StatelessWidget {
  final Item catalog;

  const DetailsPage({super.key, required this.catalog});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${catalog.price}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            AddToCart(catalog: catalog),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      catalog.image,
                      // cacheWidth: 100,
                    ))),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        catalog.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(catalog.description,
                          style: Theme.of(context).textTheme.caption,
                          textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
