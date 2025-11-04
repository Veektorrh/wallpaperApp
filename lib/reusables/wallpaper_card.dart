import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/pages/wallpaper_setup.dart';
import 'package:wallpaper_app/reusables/stylings.dart';

import '../utils/size_config.dart';

class WallpaperCard extends StatelessWidget {
  final AssetImage picture;
  final String name;
  final String description;
  final int content;

  const WallpaperCard(
      {super.key, required this.picture, required this.name, required this.description, required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>WallpaperSetup());
      },
      child: Container(
          height: SizeConfig.h(290.71),
          width: SizeConfig.w(435.33),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.sp(26)),
           image: DecorationImage(image: picture, fit: BoxFit.fill),
        ),
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.red, width: 5)
        // ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.sp(26)),

                color: Color(0xFF000000).withOpacity(0.3),
              ),
            ),


                //child: Image(image: picture, fit: BoxFit.fill,)),
            // Container(
            //   // height: SizeConfig.h(290.71),
            //   // width: SizeConfig.w(435.33),
            //   decoration: BoxDecoration(
            //     color: Color(0xFF000000).withOpacity(0.9),
            //     // border: Border.fromBorderSide(BorderSide(
            //     //     color:  Colors.red,
            //     //     width: 5,
            //     //     style: BorderStyle.solid)),
            //     image: DecorationImage(image: picture,
            //         // AssetImage('assets/images/nature.png'),
            //         fit: BoxFit.fill,),
            //     borderRadius: BorderRadius.circular(SizeConfig.sp(26)),
            //
            //   ),
            // ),
            Align(
              alignment: Alignment(-0.8, 0.8),
              child:
              Container(
                height: SizeConfig.h(94),
      width: SizeConfig.w(277),
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.red, width: 5)
                // ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: Stylings.cardHeader,),
                      Text(description, style: Stylings.cardSmall,),
                      Container(
                        height: SizeConfig.h(26),
                        width: SizeConfig.w(110),
                        padding: SizeConfig.padding(10, 0),
                        decoration: BoxDecoration(
                            color: Stylings.priWhite.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(SizeConfig.sp(30)),
                            border: Border.fromBorderSide(BorderSide(
                                color: Stylings.priWhite,
                                width: 0.5,
                                style: BorderStyle.solid))
                        ),
                        child: Text('$content wallpapers',
                          style: Stylings.navSmall.copyWith(color: Stylings.priWhite),),
                      )
                    ]
                )
                ,)
              ,),
          ],
        )


      ),
    );



  }
}
