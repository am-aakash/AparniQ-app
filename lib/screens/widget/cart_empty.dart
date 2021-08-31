import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ship_qarte/bloc_or_providers/providers.dart';
import 'package:ship_qarte/components/colors.dart';
import 'package:ship_qarte/consts/colors.dart';

class CartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 80),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/emptycart.png'),
            ),
          ),
        ),
        Text(
          'Your Cart Is Empty',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Theme.of(context).textSelectionColor,
              fontSize: 26,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          'Looks Like You didn\'t \n add anything to your cart yet',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: themeChange.darkTheme
                  ? Theme.of(context).disabledColor
                  : ColorsConsts.subTitle,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.08,
          child: RaisedButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              //side: BorderSide(color: COLORS.blueDark),
            ),
            color: COLORS.blueDark,
            child: Text(
              'Shop now'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: COLORS.whiteDark,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
