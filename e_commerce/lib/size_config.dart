import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData ? __mediaQueryData;
  static double ? screenWidth;
  static double ? screenHeight;
  static double ? defaultSize;
  static Orientation ? orientation;

  void init(BuildContext context) {
    __mediaQueryData = MediaQuery.of(context);
    screenWidth = __mediaQueryData!.size.width;
    screenHeight = __mediaQueryData!.size.height;
    orientation = __mediaQueryData!.orientation;
  }

}

double getProportionateScreenHeight(double inputHeight) {
  double ? screenHeight = SizeConfig.screenHeight;
  
  return (inputHeight / 812.0) * screenHeight!;
}
double getProportionateScreenWidth(double inputWidth) {
  double ? screenWidth = SizeConfig.screenWidth;
  
  return (inputWidth / 375.0) * screenWidth!;
}