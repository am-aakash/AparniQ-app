import 'package:flutter/material.dart';
import 'package:ship_qarte/components/colors.dart';
import 'package:ship_qarte/components/size_config.dart';

class FeedProducts extends StatefulWidget {
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
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                  minHeight: 100,
                  maxHeight: MediaQuery.of(context).size.height * 0.3),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU',
                fit: BoxFit.fitWidth,
              ),
            ),
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
                  'Product Name',
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
                    'Rs 158.99',
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
                      'Quantity: 12',
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
