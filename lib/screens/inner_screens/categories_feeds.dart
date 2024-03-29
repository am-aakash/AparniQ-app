import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ship_qarte/bloc_or_providers/products.dart';
import 'package:ship_qarte/models/models.dart';
import 'package:ship_qarte/screens/widget/feeds_products.dart';

class CategoriesFeedsScreen extends StatelessWidget {
  static const routeName = '/CategoriesFeedsScreen';
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context, listen: false);
    final categoryName = ModalRoute.of(context)?.settings.arguments as String;
    final List<Product> productsList =
        productsProvider.findByCategory(categoryName);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.47,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: List.generate(productsList.length, (index) {
            return ChangeNotifierProvider.value(
              value: productsList[index],
              child: FeedProducts(),
            );
          }),
        ),
      ),
//         StaggeredGridView.countBuilder(
//           padding: ,
//   crossAxisCount: 6,
//   itemCount: 8,
//   itemBuilder: (BuildContext context, int index) =>FeedProducts(),
//   staggeredTileBuilder: (int index) =>
//       new StaggeredTile.count(3, index.isEven ? 4 : 5),
//   mainAxisSpacing: 8.0,
//   crossAxisSpacing: 6.0,
// ),
    );
  }
}
