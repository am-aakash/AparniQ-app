import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  //static MediaQueryData _mediaQueryData;
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double blockWidth = 0.0;
  static double blockHeight = 0.0;

  void init(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockWidth = screenWidth / 100;
    blockHeight = screenHeight / 100;
  }
}
