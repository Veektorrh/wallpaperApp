import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A utility class to scale widgets, fonts, and paddings
/// based on your Figma design frame size (1140x1155).
///
/// Example usage:
///   width: SizeConfig.w(200),
///   height: SizeConfig.h(150),
///   fontSize: SizeConfig.sp(16),
///   padding: SizeConfig.padding(24, 12),
///
class SizeConfig {
  // 🔹 Your base Figma design dimensions
  static const double figmaWidth = 1440;
  static const double figmaHeight = 1051;

  // 🔹 Actual screen dimensions
  static double get width => Get.width;
  static double get height => Get.height;

  // 🔹 Scaling factors
  static double get scaleWidth => width / figmaWidth;
  static double get scaleHeight => height / figmaHeight;

  // Use the smaller of the two to keep proportions consistent
  static double get scale => min(scaleWidth, scaleHeight);

  // 🔹 Helper methods for scaling
  static double w(double value) => value * scaleWidth;   // Width
  static double h(double value) => value * scaleHeight;  // Height
  static double sp(double value) => value * scale;       // Font size
  static EdgeInsets padding(double h, double v) =>
      EdgeInsets.symmetric(
        horizontal: h * scaleWidth,
        vertical: v * scaleHeight,
      );
}