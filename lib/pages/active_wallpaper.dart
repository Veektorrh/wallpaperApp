import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/pages/settings.dart';

import '../global_variables.dart';
import '../reusables/mybutton.dart';
import '../reusables/stylings.dart';
import '../reusables/wallpaper_card.dart';
import '../utils/size_config.dart';
import 'browse_pages.dart';
import 'empty_favorite.dart';
import 'home_page.dart';

class ActiveWallpaper extends StatelessWidget {
   ActiveWallpaper({super.key});

  final LinearGradient gradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFFFBB03B), Color(0xFFEC0C43)],
  );

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
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
          // SizedBox(height: 32,),

          Expanded(
            child: Padding(
              padding: SizeConfig.padding(47, 47),
              child: Column(
                children: [
                  Container(
                    padding: SizeConfig.padding(20, 20),
                    height: SizeConfig.h(250.33),
                    width: SizeConfig.w(1346),
                    decoration: BoxDecoration(
                      color: Stylings.priWhite,
                      borderRadius: BorderRadius.circular(SizeConfig.sp(43)),
                        border: Border.fromBorderSide(BorderSide(
                            color:  Stylings.priBlack.withOpacity(0.1),
                            width: 1,
                            style: BorderStyle.solid))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: SizeConfig.h(210.33),
                                width: SizeConfig.w(117.77),
                                decoration: BoxDecoration(
                                  color: Color(0xFF000000).withOpacity(0.3),
                                    border: Border.fromBorderSide(BorderSide(
                                      strokeAlign: BorderSide.strokeAlignOutside,
                                        color: Color(0xFFE3E3E3),
                                        width: 3,
                                        style: BorderStyle.solid)),
                                    image: DecorationImage(image: AssetImage(
                                        'assets/images/active.jpg'),
                                        // AssetImage('assets/images/nature.png'),
                                        fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(SizeConfig.sp(26))
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(SizeConfig.sp(26)),
                                        color: Color(0xFF000000).withOpacity(0.3)
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: SizeConfig.w(20)),
                              Container(
                                height: SizeConfig.h(146),
                                width: SizeConfig.w(1056),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ShaderMask(
                                            shaderCallback: (bounds) {
                                              return gradient.createShader(
                                                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                                              );
                                            },
                                            child: Text(
                                              'Your Active Wallpaper',
                                              style: Stylings.headerSmall,
                                            ),
                                          ),
                                          // SizedBox(height: SizeConfig.h(12),),
                                          Text('This wallpaper is currently set as your active background', style: TextStyle(
                                            fontFamily: 'Poppings',
                                            fontSize: SizeConfig.sp(20),
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF808080),
                                          ),),
                                        ],
                                      ),
                                    ),
                                     SizedBox(height: SizeConfig.h(20),),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text('Category - ', style: Stylings.cardSmall.copyWith(color: Color(0xFF808080)),),
                                              Text('Nature', style: TextStyle(
                                                fontFamily: 'Poppings',
                                                fontSize: SizeConfig.sp(16),
                                                fontWeight: FontWeight.w500,
                                                color: Stylings.priBlack,
                                              ),),
                                            ],
                                          ),

                                          Row(
                                            children: [
                                              Text('Selection - ', style: Stylings.cardSmall.copyWith(color: Color(0xFF808080)),),
                                              Text('Wallpaper 5', style: TextStyle(
                                                fontFamily: 'Poppings',
                                                fontSize: SizeConfig.sp(16),
                                                fontWeight: FontWeight.w500,
                                                color: Stylings.priBlack,
                                              ),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment(1, 1),
                          child: Container(
                            height: SizeConfig.h(40),
                            width: SizeConfig.w(92),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height:SizeConfig.h(40),
                                  width: SizeConfig.w(40),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF7C7C7C1A).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(SizeConfig.sp(11)),
                                      border: Border.fromBorderSide(BorderSide(
                                          color:  Color(0xFFE5E5E5),
                                          width: 0.5,
                                          style: BorderStyle.solid))

                                  ),
                                  child: Icon(Icons.ios_share,size: 20,)
                                  //Image(image: AssetImage('assets/images/uploadicon.png'), fit: BoxFit.contain,),
                                ),

                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF7C7C7C1A).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(11),
                                      border: Border.fromBorderSide(BorderSide(
                                          color:  Color(0xFFE5E5E5),
                                          width: 0.5,
                                          style: BorderStyle.solid))

                                  ),
                                  child: Icon(Icons.settings_outlined, size: 20,)
                                  //Image(image: AssetImage('assets/images/settingsicon.png'), fit: BoxFit.contain,),
                                ),

                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment(-1, -1),
                  //   child: ShaderMask(
                  //     shaderCallback: (bounds) {
                  //       return gradient.createShader(
                  //         Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  //       );
                  //     },
                  //     child: Text(
                  //       'Discover Beautiful Wallpapers',
                  //       style: Stylings.headerLarge,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 8,),
                  // Align(
                  //   alignment: Alignment(-1, -1),
                  //   child: Text(
                  //     'Discover curated collections of stunning wallpapers. Browse by \ncategory, preview in full-screen, and set your favorites.', style: Stylings.subHeader,
                  //
                  //   ),
                  // ),
                  SizedBox(height: SizeConfig.h(32)),
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
                            mainAxisSpacing: Get.height*0.019,
                             childAspectRatio: SizeConfig.w(435.33) / SizeConfig.h(290.71),
                            crossAxisSpacing: Get.width * 0.013,
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
