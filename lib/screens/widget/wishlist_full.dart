import 'package:flutter/material.dart';
import 'package:ship_qarte/components/colors.dart';
import 'package:ship_qarte/consts/colors.dart';

class WishlistFull extends StatefulWidget {
  @override
  _WishlistFullState createState() => _WishlistFullState();
}

class _WishlistFullState extends State<WishlistFull> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: 30.0, bottom: 0.0, top: 10),
          child: Material(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(5.0),
            elevation: 3.0,
            child: InkWell(
              onTap: () {},
              child: Container(
                color: COLORS.blueDark,
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 80,
                      child: Image.network(
                          'https://abong.com.bd/public//admin/media/2020/03/yellow_mesh_men_sport_sneaker_shoesjpeg_20200307141459.jpeg'),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Product Title',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "Rs 516",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        positionedRemove(),
      ],
    );
  }

  Widget positionedRemove() {
    return Positioned(
      top: 20,
      right: 15,
      child: Container(
        height: 25,
        width: 25,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          padding: EdgeInsets.all(0.0),
          color: ColorsConsts.favColor,
          child: Icon(
            Icons.clear,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
