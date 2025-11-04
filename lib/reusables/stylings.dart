import 'dart:ui';
import 'package:wallpaper_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Stylings {
  ///Colors
  static Color priBlack = Color(0xFF000000);
  static Color priLight = Color(0xFF575757);
  static Color priWhite = Color(0xFFFFFFFF);
  static Color activeBut = Color(0xFFF5F5F5);
  static Color priBackground = Color(0xFFF8F8F8);
  static Color selected = Color(0xFFFFA821);



  /// FONT STYLES
  static TextStyle navSmall = TextStyle(
      fontFamily: 'Poppings',
      fontSize: SizeConfig.sp(14),
      fontWeight: FontWeight.w400,
      color: Stylings.priBlack,
  );
  static TextStyle subHeader = TextStyle(
    fontFamily: 'Poppings',
    fontSize: SizeConfig.sp(24),
    fontWeight: FontWeight.w400,
    color: Stylings.priBlack,
  );
  static TextStyle cardHeader = TextStyle(
    fontFamily: 'Poppings',
    fontSize: SizeConfig.sp(24),
    fontWeight: FontWeight.w600,
    color: Stylings.priWhite,
  );
  static TextStyle cardSmall = TextStyle(
    fontFamily: 'Poppings',
    fontSize: SizeConfig.sp(16),
    fontWeight: FontWeight.w400,
    color: Stylings.priWhite,
  );

  static TextStyle headerLarge = TextStyle(
    fontFamily: 'ClashDisplay',
    fontSize:SizeConfig.sp(60),
    fontWeight: FontWeight.w500,
    color: Colors.white
  );

  static TextStyle headerSmall = TextStyle(
      fontFamily: 'ClashDisplay',
      fontSize: SizeConfig.sp(36),
      fontWeight: FontWeight.w500,
      color: Colors.white
  );

  final LinearGradient gradient = LinearGradient(
    begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFFFBB03B),
        Color(0xFFEC0C43)

  ]);
}