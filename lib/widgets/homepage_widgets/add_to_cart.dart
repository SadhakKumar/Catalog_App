import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;

  const AddToCart({super.key, required this.catalog});
  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            isInCart = !isInCart ? true : false;
            final _catalog = CatalogModel();

            _cart.catalog = _catalog;
            _cart.add(widget.catalog);
            setState(() {});
          }
        },
        child: isInCart ? Icon(Icons.done) : Text("Add to Cart"),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyTheme.darkBlueish),
            shape: MaterialStateProperty.all(StadiumBorder())));
  }
}
