import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/details.dart';
import '../../models/catalog.dart';
import 'catalog_item.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsPage(catalog: catalog))),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}
