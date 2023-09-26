import 'package:flutter/material.dart';

class AppSize{
  MediaQueryData?_queryData;
  static double? height;
  static double? width;
  static double? screenHeight;
  static double? screenWidth;
  void init(BuildContext context){
    _queryData=MediaQuery.of(context);
    height=_queryData!.size.height;
    width=_queryData!.size.width;
    screenWidth=width!/100;
    screenHeight=height!/100;
  }
}

double getHeight(double size){
  double screenHeight=AppSize.height!;
  return (size/812)*screenHeight;
}

double getWidth(double size){
  double screenWidth=AppSize.width!;
  return (size/375)*screenWidth;
}