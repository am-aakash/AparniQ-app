import 'package:flutter/material.dart';
import 'package:ship_qarte/components/colors.dart';
import 'package:ship_qarte/components/size_config.dart';
import 'package:ship_qarte/data/products.dart';
import 'package:ship_qarte/models/models.dart';
import 'package:ship_qarte/screens/ui.dart';
import 'package:ship_qarte/screens/widget/feeds_products.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Feeds extends StatelessWidget {
  static const routeName = '/Feeds';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLORS.blueDark,
        title: Text('Feeds'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(WishlistScreen.routeName);
            },
            icon: Icon(Icons.favorite, color: Colors.red),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
            icon: Icon(Icons.shopping_cart, color: Colors.blue[200]),
          )
        ],
      ),
      body:
          // StaggeredGridView.countBuilder(
          //   crossAxisCount: 4,
          //   itemCount: 100,
          //   itemBuilder: (BuildContext context, int index) => Padding(
          //     padding:
          //         const EdgeInsets.only(top: 4, right: 4, left: 4, bottom: 4),
          //     child: FeedProducts(),
          //   ),
          //   staggeredTileBuilder: (int index) =>
          //       new StaggeredTile.count(2, index.isEven ? 2.9 : 2.5),
          //   mainAxisSpacing: 8.0,
          //   crossAxisSpacing: 6.0,
          // )
          Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.51,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: List.generate(products.length, (index) {
            return FeedProducts(
              id: products[index].id,
              description: products[index].description,
              price: products[index].price,
              imageUrl: products[index].imageUrl,
              quantity: products[index].quantity,
              isFavorite: products[index].isFavorite,
            );
          }),
        ),
      ),
    );
  }
}
