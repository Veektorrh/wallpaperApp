import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/reusables/stylings.dart';

import '../utils/size_config.dart';

class Mybutton extends StatelessWidget {
  final String bText;

  final ImageProvider picture;
   final bool isActive;
  // final bool hasMargin;

  const Mybutton(
      {super.key,
        required this.bText,

         this.isActive = true,
        // this.hasMargin = true,
  required this.picture});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.h(44),
      padding: SizeConfig.padding(16, 10),
      // margin: hasMargin ? EdgeInsets.symmetric(horizontal: 6) : EdgeInsets.zero,
      //alignment: const Alignment(0, 0),
      decoration: BoxDecoration(
        color: isActive ? Stylings.activeBut : null,
    border: isActive ? Border.fromBorderSide(BorderSide(
        color:  Stylings.priBlack.withOpacity(0.1),
        width: 1,
        style: BorderStyle.solid)) : null,
        // color: isActive ? bColor : Colors.white,
        borderRadius: BorderRadius.circular(SizeConfig.sp(12)),
      ),
      //child: Text(bText,style: Stylings.thicSubtitle.copyWith(color: isActive?Colors.white:Colors.grey.shade200,fontSize: 11*Get.size.aspectRatio*2.5),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: SizeConfig.h(24),
              width: SizeConfig.w(24),
              child: Image(image: picture, fit: BoxFit.contain,)),
          SizedBox(width: SizeConfig.w(10),),
          Text(bText,
              style: Stylings.navSmall),
        ],
      ),
    );
  }
}