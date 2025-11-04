import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:math';
import 'package:flutter/material.dart';

class SizeConfig {
  static late double _screenWidth;
  static late double _screenHeight;
  static const double figmaWidth = 1440;
  static const double figmaHeight = 1051;

  static double scaleWidth = 1.0;
  static double scaleHeight = 1.0;
  static double scale = 1.0;

  /// Call this inside every screen’s build() method
  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;

    scaleWidth = _screenWidth / figmaWidth;
    scaleHeight = _screenHeight / figmaHeight;

    // Use the smaller scale for consistent font sizing
    scale = min(scaleWidth, scaleHeight);
  }

  static double w(double value) => value * scaleWidth;
  static double h(double value) => value * scaleHeight;
  static double sp(double value) => value * scale;
  static EdgeInsets padding(double h, double v) =>
      EdgeInsets.symmetric(
        horizontal: h * scaleWidth,
        vertical: v * scaleHeight,
      );
}

// class SizeConfig {
//   static late double _screenWidth;
//   static late double _screenHeight;
//   static const double figmaWidth = 1440;
//   static const double figmaHeight = 1051;
//
//
//   static double get width => Get.width;
//   static double get height => Get.height;
//
//
//   static double get scaleWidth => width / figmaWidth;
//   static double get scaleHeight => height / figmaHeight;
//
//
//   static double get scale => min(scaleWidth, scaleHeight);
//
//
//   static double w(double value) => value * scaleWidth;   // Width
//   static double h(double value) => value * scaleHeight;  // Height
//   static double sp(double value) => value * scale;       // Font size
//   static EdgeInsets padding(double h, double v) =>
//       EdgeInsets.symmetric(
//         horizontal: h * scaleWidth,
//         vertical: v * scaleHeight,
//       );
// }