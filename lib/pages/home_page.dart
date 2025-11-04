import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/global_variables.dart';
import 'package:wallpaper_app/pages/active_wallpaper.dart';
import 'package:wallpaper_app/pages/browse_pages.dart';
import 'package:wallpaper_app/pages/empty_favorite.dart';
import 'package:wallpaper_app/pages/settings.dart';
import 'package:wallpaper_app/reusables/stylings.dart';
import 'package:wallpaper_app/reusables/wallpaper_card.dart';
import 'package:wallpaper_app/utils/size_config.dart';

import '../reusables/mybutton.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final LinearGradient gradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFFFBB03B), Color(0xFFEC0C43)],
  );

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor: Stylings.priBackground,
      body: Column(
        children: [
          Container(
            padding: SizeConfig.padding(47, 0),
            color: Colors.white,
            height: SizeConfig.h(98),
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: SizeConfig.padding (20,20),
                  width: SizeConfig.w(185),
                  height: SizeConfig.h(61),
                  child: Row(
                    children: [
                      SizedBox(

                        height: SizeConfig.h(16),
                        width: SizeConfig.w(16),
                        child: Padding(
                          padding: SizeConfig.padding(1, 1),
                          child: Image(
                            image: AssetImage('assets/images/studio_icon.png'),
                            width: SizeConfig.w(14),
                            height: SizeConfig.h(14),
                          ),
                        ),
                      ),
                      SizedBox(width: SizeConfig.w(8)),
                      Container(
                          width: SizeConfig.w(121),
                          height: SizeConfig.h(21),
                          child: Text('Wallpaper Studio', style: Stylings.navSmall)),
                    ],
                  ),
                ),
                Container(
                  width: SizeConfig.w(523),
                  height: SizeConfig.h(44),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(()=> ActiveWallpaper());
                        },
                        child: Mybutton(
                          bText: 'Home',
                          isActive: false,

                          picture: AssetImage('assets/images/homeicon.png'),
                        ),
                      ),
                      SizedBox(width: SizeConfig.w(12)),
                      GestureDetector(
                        onTap: (){
                          Get.to(()=>BrowsePage());
                        },
                        child: Mybutton(
                          bText: 'Browse',
                          isActive: false,
                          picture: AssetImage('assets/images/browseicon.png'),
                        ),
                      ),
                      SizedBox(width:SizeConfig.w(12)),
                      GestureDetector(
                        onTap: (){
                          Get.to(()=>EmptyFavorite());
                        },
                        child: Mybutton(
                          bText: 'Favorite',
                          isActive: false,
                          picture: AssetImage('assets/images/favicon.png'),
                        ),
                      ),
                      SizedBox(width: SizeConfig.w(12)),
                      GestureDetector(
                        onTap: (){
                          Get.to(()=>Settings());
                        },
                        child: Mybutton(
                          bText: 'Settings',
                          isActive: false,
                          picture: AssetImage('assets/images/settingsicon.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: SizeConfig.padding(47, 47),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(-1, -1),
                    child: ShaderMask(
                      shaderCallback: (bounds) {
                        return gradient.createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        );
                      },
                      child: Text(
                        'Discover Beautiful Wallpapers',
                        style: Stylings.headerLarge,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.h(8)),
                  Align(
                    alignment: Alignment(-1, -1),
                    child: Text(
                      'Discover curated collections of stunning wallpapers. Browse by \ncategory, preview in full-screen, and set your favorites.', style: Stylings.subHeader,

                    ),
                  ),
                  SizedBox(height: SizeConfig.h(50)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Categories', style: TextStyle(fontFamily: 'Poppins', fontSize: SizeConfig.sp(32), fontWeight: FontWeight.w500),),
                      Text('See All', style: Stylings.subHeader,)
                    ],
                  ),
                  SizedBox(height: SizeConfig.h(23)),
                  Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: wallpapers.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: SizeConfig.h(23),
                            childAspectRatio: SizeConfig.w(435.33) / SizeConfig.h(290.71),
                            crossAxisSpacing: SizeConfig.w(20),
                            crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          final wallpaper = wallpapers[index];
                          return WallpaperCard(
                              picture: AssetImage(wallpaper['poster'] as String),
                              name: wallpaper['name'] as String,
                              description: wallpaper['description'] as String,
                              content: (wallpaper['designs'] as List).length
                          );
                        }),
                  ),
                  // Stack(
                  //   children: [
                  //     Container(
                  //         height: 290.71,
                  //         width: 435.33,
                  //         decoration: BoxDecoration(
                  //
                  //           image: DecorationImage(image: AssetImage('assets/images/nature.png'),fit: BoxFit.fill),
                  //           borderRadius: BorderRadius.circular(26),
                  //
                  //         ),),
                  //          Positioned(
                  //           top: 178,
                  //           left: 25,
                  //           child: Container(
                  //             height: 94,
                  //             width: 277,
                  //
                  //             child: Column(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text('Nature', style: Stylings.cardHeader,),
                  //                 Text('Mountains, Forests and Landscapes', style: Stylings.cardSmall,),
                  //                 Container(
                  //                   height: 26,
                  //                   width: 110,
                  //                   decoration: BoxDecoration(
                  //                     color: Stylings.priWhite.withOpacity(0.2),
                  //                     borderRadius: BorderRadius.circular(30),
                  //                       border: Border.fromBorderSide(BorderSide(
                  //                           color:  Stylings.priWhite,
                  //                           width: 0.5,
                  //                           style: BorderStyle.solid))
                  //                   ),
                  //                   child: Center(child: Text('3 wallpapers', style: Stylings.navSmall.copyWith(color: Stylings.priWhite),)),
                  //                 )
                  //
                  //               ],
                  //             ),
                  //           ),
                  //         )
                  //
                  //     ,
                  //   ]
                  //
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
