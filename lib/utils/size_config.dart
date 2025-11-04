import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SizeConfig {

  static const double figmaWidth = 1440;
  static const double figmaHeight = 1051;


  static double get width => Get.width;
  static double get height => Get.height;


  static double get scaleWidth => width / figmaWidth;
  static double get scaleHeight => height / figmaHeight;


  static double get scale => min(scaleWidth, scaleHeight);


  static double w(double value) => value * scaleWidth;   // Width
  static double h(double value) => value * scaleHeight;  // Height
  static double sp(double value) => value * scale;       // Font size
  static EdgeInsets padding(double h, double v) =>
      EdgeInsets.symmetric(
        horizontal: h * scaleWidth,
        vertical: v * scaleHeight,
      );
}