import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ship_qarte/bloc_or_providers/providers.dart';
import 'package:ship_qarte/components/colors.dart';
import 'package:ship_qarte/consts/colors.dart';
import 'package:ship_qarte/consts/my_icons.dart';

import 'widget/cart_empty.dart';
import 'widget/cart_full.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    List products = [];
    return //products.isEmpty
        //? Scaffold(body: CartEmpty())
        //:
        Scaffold(
      bottomSheet: checkoutSection(context),
      appBar: AppBar(
        backgroundColor: COLORS.blueDark,
        title: Text('Cart Items Count'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(MyAppIcons.trash),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 60),
        child: ListView.builder(
            itemCount: cartProvider.getCartItems.length,
            itemBuilder: (BuildContext ctx, int index) {
              return ChangeNotifierProvider.value(
                value: cartProvider.getCartItems.values.toList()[index],
                child: CartFull(
                  productId: cartProvider.getCartItems.keys.toList()[index],
                  // id:  cartProvider.getCartItems.values.toList()[index].id,
                  // productId: cartProvider.getCartItems.keys.toList()[index],
                  // price: cartProvider.getCartItems.values.toList()[index].price,
                  // title: cartProvider.getCartItems.values.toList()[index].title,
                  // imageUrl: cartProvider.getCartItems.values.toList()[index].imageUrl,
                  // quatity: cartProvider.getCartItems.values.toList()[index].quantity,
                ),
              );
            }),
      ),
    );
  }

  Widget checkoutSection(BuildContext ctx) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            /// mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Material(
                  borderRadius: BorderRadius.circular(30),
                  color: COLORS.blueDark,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Checkout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: COLORS.whiteDark,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Text(
                'Total:',
                style: TextStyle(
                    color: COLORS.blueDark,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                ' Rs 6179.0',
                //textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ));
  }
}
