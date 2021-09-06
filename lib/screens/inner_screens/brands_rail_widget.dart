import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ship_qarte/components/colors.dart';
import 'package:ship_qarte/models/models.dart';
import 'package:ship_qarte/screens/inner_screens/product_details.dart';

class BrandsNavigationRail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsAttributes = Provider.of<Product>(context);
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,
          arguments: productsAttributes.id),
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        margin: EdgeInsets.only(right: 10.0, bottom: 5, top: 18),
        constraints: BoxConstraints(
            minHeight: 150, minWidth: double.infinity, maxHeight: 180),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                // padding: EdgeInsets.only(left: 2, right: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  // color: Theme.of(context).backgroundColor,
                  image: DecorationImage(
                      image: NetworkImage(
                        productsAttributes.imageUrl!,
                      ),
                      fit: BoxFit.scaleDown),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 2.0)
                  ],
                ),
              ),
            ),
            FittedBox(
              child: Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    // color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5.0, 5.0),
                          blurRadius: 10.0)
                    ]),
                width: 160,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      productsAttributes.title!,
                      maxLines: 4,
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: COLORS.blueDark),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FittedBox(
                      child: Text(
                          '₹ ${((productsAttributes.price!) * 191).toStringAsFixed(2)}',
                          maxLines: 1,
                          style: TextStyle(
                            color: COLORS.blueDark,
                            fontSize: 30.0,
                          )),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(productsAttributes.productCategoryName!,
                        style: TextStyle(
                            color: COLORS.blueMedium, fontSize: 18.0)),
                    SizedBox(
                      height: 20.0,
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
