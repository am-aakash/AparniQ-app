import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:ship_qarte/bloc_or_providers/providers.dart';
import 'package:ship_qarte/components/colors.dart';
import 'package:ship_qarte/consts/colors.dart';
import 'package:ship_qarte/models/cart_attr.dart';
import 'package:ship_qarte/screens/inner_screens/product_details.dart';

class CartFull extends StatefulWidget {
  final String? productId;

  CartFull({this.productId});
  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final cartAttr = Provider.of<CartAttr>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    double subTotal = cartAttr.price! * cartAttr.quantity!;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,
          arguments: widget.productId),
      child: Container(
        height: 135,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: const Radius.circular(16.0),
            topRight: const Radius.circular(16.0),
          ),
          color: COLORS.blueDark,
        ),
        child: Row(
          children: [
            Container(
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(cartAttr.imageUrl!),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 6, top: 2),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            cartAttr.title!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: COLORS.whiteDark),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(32.0),
                            // splashColor: ,
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: 50,
                              child: Icon(
                                Icons.delete,
                                color: Colors.red[400],
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'Price:',
                    //       style: TextStyle(color: COLORS.whiteDark),
                    //     ),
                    //     SizedBox(
                    //       width: 5,
                    //     ),
                    //     Text(
                    //       'Rs ${cartAttr.price}',
                    //       style: TextStyle(
                    //           fontSize: 14,
                    //           fontWeight: FontWeight.w600,
                    //           color: COLORS.whiteDark),
                    //     ),
                    //   ],
                    // ),
                    Row(
                      children: [
                        Text(
                          'Sub Total:',
                          style: TextStyle(color: COLORS.whiteDark),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Rs ${subTotal.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color:
                                  // themeChange.darkTheme
                                  //     ? Colors.brown.shade900
                                  //:
                                  COLORS.whiteDark),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Ships Free',
                          style: TextStyle(
                              color:
                                  // themeChange.darkTheme
                                  // ? Colors.brown.shade900
                                  // :
                                  Theme.of(context).accentColor),
                        ),
                        Spacer(),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4.0),
                            // splashColor: ,
                            onTap: cartAttr.quantity! < 2
                                ? null
                                : () {
                                    cartProvider.reduceItemByOne(
                                        widget.productId!,
                                        cartAttr.price!,
                                        cartAttr.title!,
                                        cartAttr.imageUrl!);
                                  },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.red,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 12,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [COLORS.offWhite, COLORS.yellowDark],
                                  stops: [0.0, 0.7]),
                            ),
                            child: Text(
                              cartAttr.quantity.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4.0),
                            // splashColor: ,
                            onTap: () {},
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
