import 'package:flutter/material.dart';
import 'package:ship_qarte/components/colors.dart';
import 'widget/wishlist_empty.dart';
import 'widget/wishlist_full.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';
  @override
  Widget build(BuildContext context) {
    List wishlistList = [];
    return wishlistList.isNotEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
            appBar: AppBar(
              backgroundColor: COLORS.blueDark,
              title: Text('Wishlist'),
            ),
            body: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext ctx, int index) {
                return WishlistFull();
              },
            ),
          );
  }
}
