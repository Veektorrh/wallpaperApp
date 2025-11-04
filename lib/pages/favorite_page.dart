import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/pages/settings.dart';
import 'package:wallpaper_app/pages/wallpaper_setup.dart';

import '../global_variables.dart';
import '../reusables/mybutton.dart';
import '../reusables/stylings.dart';
import '../utils/size_config.dart';
import 'active_wallpaper.dart';
import 'browse_pages.dart';
import 'empty_favorite.dart';
import 'home_page.dart';

class FavoritePage extends StatelessWidget {
   FavoritePage({super.key});

  final LinearGradient gradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFFFBB03B), Color(0xFFEC0C43)],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                GestureDetector(
                  onTap: (){
                    Get.to(()=>HomePage());
                  },
                  child: Container(
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
                        'Saved Wallpapers',
                        style: Stylings.headerLarge,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-1, -1),
                    child: Text(
                      'Your Saved Wallpaper Collection', style: Stylings.subHeader,

                    ),
                  ),
                  SizedBox(height: SizeConfig.h(50),),
                  Expanded(
                    child: GridView.builder(
                      itemCount:
                      (wallpapers[0]['designs'] as List)
                          .length,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: SizeConfig.h(23),
                        crossAxisSpacing: SizeConfig.w(20),
                        childAspectRatio: SizeConfig.w(190)/SizeConfig.h(290),
                        crossAxisCount: 6,
                      ),
                      itemBuilder: (context, index) {
                        final wallpaper = wallpapers[0];
                        return
                          GestureDetector(
                            onTap: (){
                              Get.to(()=>WallpaperSetup());
                            },
                            child: Container(
                              height: SizeConfig.h(290.71),
                              width: SizeConfig.w(190.18),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(
                                    (16)),
                                // border: Border.all(color: Colors.red, width: 5),
                                image: DecorationImage(
                                  image: AssetImage(
                                    ((wallpaper['designs'])
                                    as List<
                                        Map<String, String>
                                    >)[index]['image']!,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment(0.8, -0.8),
                                    child: Container(
                                      height: SizeConfig.h(40),
                                      width: SizeConfig.w(40),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(30),
                                        color: Stylings.priWhite,
                                        border: Border.all(
                                          color: Stylings.priWhite,
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.favorite,size: SizeConfig.sp(18), color: Stylings.selected,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(-0.8, 0.9),
                                    child: Container(
                                      // decoration: BoxDecoration(
                                      //   border: Border.all(color: Colors.red, width: 5)
                                      // ),
                                      width: SizeConfig.w(100),
                                      height: SizeConfig.h(75),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ((wallpaper['designs']
                                            as List<
                                                Map<String, String>
                                            >)[index]['title']!),
                                            style: Stylings.subHeader
                                                .copyWith(
                                              color:
                                              Stylings.priWhite,
                                            ),
                                          ),
                                          Container(
                                            height: SizeConfig.h(25),
                                            width: SizeConfig.w(72),
                                            decoration: BoxDecoration(
                                              color: Stylings.priWhite
                                                  .withOpacity(0.2),
                                              borderRadius:
                                              BorderRadius.circular(SizeConfig.sp(24),
                                              ),
                                              border:
                                              Border.fromBorderSide(
                                                BorderSide(
                                                  color:
                                                  Stylings
                                                      .priWhite,
                                                  width: 0.5,
                                                  style:
                                                  BorderStyle
                                                      .solid,
                                                ),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                wallpaper['name']
                                                as String,
                                                style: Stylings
                                                    .navSmall
                                                    .copyWith(
                                                  color:
                                                  Stylings
                                                      .priWhite,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),
                                  )
                                ],
                              ),
                            ),
                          );

                        //   Stack(
                        //   children: [
                        //     Container(
                        //        height: SizeConfig.h(290.71),
                        //        width: SizeConfig.w(190.18),
                        //       decoration: BoxDecoration(
                        //         borderRadius:
                        //             BorderRadius.circular(SizeConfig.sp(16)),
                        //         image: DecorationImage(
                        //           image: AssetImage(
                        //             ((wallpaper['designs'])
                        //                 as List<
                        //                   Map<String, String>
                        //                 >)[index]['image']!,
                        //           ),
                        //           fit: BoxFit.fill,
                        //         ),
                        //       ),
                        //     ),
                        //     Positioned(
                        //       top: 200,
                        //       left: 15,
                        //       child:
                        //       Column(
                        //         crossAxisAlignment:
                        //             CrossAxisAlignment.start,
                        //         children: [
                        //           Text(
                        //             ((wallpaper['designs']
                        //                 as List<
                        //                   Map<String, String>
                        //                 >)[index]['title']!),
                        //             style: Stylings.subHeader
                        //                 .copyWith(
                        //                   color:
                        //                       Stylings.priWhite,
                        //                 ),
                        //           ),
                        //           Container(
                        //             height: 25,
                        //             width: 72,
                        //             decoration: BoxDecoration(
                        //               color: Stylings.priWhite
                        //                   .withOpacity(0.2),
                        //               borderRadius:
                        //                   BorderRadius.circular(
                        //                     24,
                        //                   ),
                        //               border:
                        //                   Border.fromBorderSide(
                        //                     BorderSide(
                        //                       color:
                        //                           Stylings
                        //                               .priWhite,
                        //                       width: 0.5,
                        //                       style:
                        //                           BorderStyle
                        //                               .solid,
                        //                     ),
                        //                   ),
                        //             ),
                        //             child: Center(
                        //               child: Text(
                        //                 wallpaper['name']
                        //                     as String,
                        //                 style: Stylings.navSmall
                        //                     .copyWith(
                        //                       color:
                        //                           Stylings
                        //                               .priWhite,
                        //                     ),
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     Align(
                        //       alignment: Alignment(0.8, -0.8),
                        //       child: Container(
                        //         height: 40,
                        //         width: 40,
                        //         decoration: BoxDecoration(
                        //           borderRadius:
                        //               BorderRadius.circular(30),
                        //           color: Stylings.priWhite
                        //               .withOpacity(0.2),
                        //           border: Border.all(
                        //             color: Stylings.priWhite,
                        //             width: 0.5,
                        //           ),
                        //         ),
                        //         child: Center(
                        //           child: Icon(
                        //             Icons.favorite_border,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // );
                      },
                    ),
                  )

                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
