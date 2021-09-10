import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:ship_qarte/components/colors.dart';
import 'package:ship_qarte/models/product.dart';
import 'package:ship_qarte/screens/inner_screens/product_details.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsAttributes = Provider.of<Product>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: COLORS.whiteDark,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              10.0,
            ),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                10.0,
              ),
              bottomRight: Radius.circular(10.0),
            ),
            onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,
                arguments: productsAttributes.id),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 170,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(productsAttributes.imageUrl!),
                              fit: BoxFit.scaleDown)),
                    ),
                    // Positioned(
                    //   right: 12,
                    //   top: 10,
                    //   child: Icon(
                    //     Icons.star,
                    //     color: Colors.grey.shade800,
                    //   ),
                    // ),
                    Positioned(
                      right: 10,
                      top: 7,
                      child: Icon(
                        Icons.star_border,
                        color: COLORS.blueDark,
                      ),
                    ),
                    Positioned(
                      right: 12,
                      bottom: 32.0,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        color: COLORS.blueDark,
                        child: Text(
                          '₹ ${((productsAttributes.price)! * 191).toStringAsFixed(0)} ',
                          style: TextStyle(
                            color: COLORS.whiteDark,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productsAttributes.title!,
                        maxLines: 1,
                        style: TextStyle(
                            color: COLORS.blueDark,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 160,
                            child: Text(
                              productsAttributes.description!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                          Spacer(),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(30.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  MaterialCommunityIcons.cart_plus,
                                  size: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
