import 'package:flutter/material.dart';
import 'package:ship_qarte/components/colors.dart';
import 'package:ship_qarte/components/size_config.dart';
import 'package:ship_qarte/screens/widget/feeds_products.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Feeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: COLORS.blueDark,
          title: Text('Feeds'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite, color: Colors.red),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart, color: Colors.blue[200]),
            )
          ],
        ),
        body: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding:
                const EdgeInsets.only(top: 4, right: 4, left: 4, bottom: 4),
            child: FeedProducts(),
          ),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2.9 : 2.5),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 6.0,
        )
        // GridView.count(
        //   crossAxisCount: 2,
        //   childAspectRatio: 0.78,
        //   // crossAxisSpacing: 4,
        //   children: List.generate(100, (index) {
        //     return Padding(
        //       padding:
        //           const EdgeInsets.only(top: 4, right: 4, left: 4, bottom: 4),
        //       child: FeedProducts(),
        //     );
        //   }),
        // ),
        );
  }
}
