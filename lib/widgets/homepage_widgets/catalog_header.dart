import 'package:flutter/material.dart';
import '../themes.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(
              fontSize: 40,
              color: MyTheme.darkBlueish,
              fontWeight: FontWeight.bold),
        ),
        Text(
          "Trending products",
          style: TextStyle(color: MyTheme.darkBlueish, fontSize: 20),
        )
      ],
    );
  }
}
