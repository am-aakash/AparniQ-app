import 'package:flutter/material.dart';
import 'package:ship_qarte/components/colors.dart';
import 'package:ship_qarte/components/size_config.dart';
import 'package:badges/badges.dart';
import 'package:ship_qarte/models/models.dart';

class FeedProducts extends StatefulWidget {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  final String? productCategoryName;
  final String? brand;
  final int? quantity;
  final bool? isFavorite;
  final bool? isPopular;

  const FeedProducts(
      {Key? key,
      this.id,
      this.title,
      this.description,
      this.price,
      this.imageUrl,
      this.productCategoryName,
      this.brand,
      this.quantity,
      this.isFavorite,
      this.isPopular})
      : super(key: key);

  @override
  _FeedProductsState createState() => _FeedProductsState();
}

class _FeedProductsState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.blockWidth * 46,
      height: SizeConfig.blockHeight * 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: COLORS.blueDark),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * 0.32,
                    maxHeight: MediaQuery.of(context).size.height * 0.33,
                  ),
                  child: Image.network(
                    '${widget.imageUrl}',
                    fit: BoxFit.scaleDown,
                    // fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Badge(
                toAnimate: true,
                shape: BadgeShape.square,
                badgeColor: COLORS.redDark,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(5)),
                badgeContent: Text('New',
                    style: TextStyle(color: Colors.white, fontSize: 10)),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            margin: EdgeInsets.only(left: 5, bottom: 0, right: 3, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4,
                ),
                Text(
                  '${widget.id}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '₹${widget.price}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantity: ${widget.quantity}',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(18.0),
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.grey,
                          )),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
