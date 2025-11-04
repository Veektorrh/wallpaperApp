import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wallpaper_app/pages/settings.dart';
import 'package:wallpaper_app/pages/wallpaper_setup.dart';
import 'package:wallpaper_app/utils/size_config.dart';

import '../global_variables.dart';
import '../reusables/mybutton.dart';
import '../reusables/stylings.dart';
import 'active_wallpaper.dart';
import 'browse_pages.dart';
import 'empty_favorite.dart';
import 'home_page.dart';

class WallpaperDetails extends StatefulWidget {
  const WallpaperDetails({super.key});

  @override
  State<WallpaperDetails> createState() => _WallpaperSetupState();
}

class _WallpaperSetupState extends State<WallpaperDetails> {
  bool isGrid = true;

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
          //SizedBox(height: 50,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.red)
              ),
              // color: Colors.transparent,
              // height: SizeConfig.h(950),
              // width: SizeConfig.w(1440),
              child: Stack(
                children: [
                  Padding(
                  padding: SizeConfig.padding(47, 47),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: SizeConfig.h(746.42),
                        width: SizeConfig.w(611),
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.red, width: 5)
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.arrow_back_rounded,
                                  size: SizeConfig.sp(16),
                                  color: Stylings.priBlack,
                                ),
                                Text(
                                  'Back to Categories',
                                  style: TextStyle(
                                    fontFamily: 'Poppings',
                                    fontSize: SizeConfig.sp(20),
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF979797),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.h(50),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Nature',
                                  style: TextStyle(
                                    fontFamily: 'ClashDisplay',
                                    fontSize: SizeConfig.sp(48),
                                    fontWeight: FontWeight.w400,
                                    color: Stylings.priBlack,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isGrid = !isGrid;
                                    });
                                  },
                                  child: Icon(
                                    isGrid
                                        ? Icons.table_rows_rounded
                                        : Icons.grid_view_outlined,
                                    size: SizeConfig.sp(27),
                                    color: Stylings.selected,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.h(24,)),
                            Expanded(
                              child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 1000),
                                child:
                                isGrid
                                    ?
                                GridView.builder(
                                  itemCount:
                                  (wallpapers[0]['designs'] as List)
                                      .length,
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: SizeConfig.h(23),
                                    crossAxisSpacing: SizeConfig.w(20),
                                    childAspectRatio: 190/290,
                                    crossAxisCount: 3,
                                  ),
                                  itemBuilder: (context, index) {
                                    final wallpaper = wallpapers[0];
                                    return
                                      Container(
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
                                                  color: Stylings.priWhite
                                                      .withOpacity(0.2),
                                                  border: Border.all(
                                                    color: Stylings.priWhite,
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.favorite_border,size: SizeConfig.sp(18),
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
                                )
                                    : ListView.builder(
                                  itemCount:
                                  (wallpapers[0]['designs'] as List)
                                      .length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    final wallpaper = wallpapers[0];
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Stylings.priBlack
                                                .withOpacity(0.1),
                                            width: 1,
                                            strokeAlign:
                                            BorderSide.strokeAlignInside,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: SizeConfig.h(160.12),
                                            width: SizeConfig.w(150.21),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                16.56,
                                              ),
                                              // border: Border.all(color: Colors.red, width: 5, style: BorderStyle.solid),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  ((wallpaper['designs'])
                                                  as List<
                                                      Map<String, String>
                                                  >)[index]['image']!,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Container(
                                            height: SizeConfig.h(130),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ((wallpaper['designs']
                                                  as List<
                                                      Map<String, String>
                                                  >)[index]['title']!),
                                                  style: Stylings.subHeader,
                                                ),
                                                Container(
                                                  height: SizeConfig.h(34),
                                                  width: SizeConfig.w(110),
                                                  decoration: BoxDecoration(
                                                    color: Color(
                                                      0xFF8787871A,
                                                    ).withOpacity(0.1),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                      30,
                                                    ),
                                                    border:
                                                    Border.fromBorderSide(
                                                      BorderSide(
                                                        color: Stylings
                                                            .priBlack
                                                            .withOpacity(
                                                          0.5,
                                                        ),
                                                        width: 1,
                                                        style:
                                                        BorderStyle
                                                            .solid,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      wallpapers[0]['name']
                                                      as String,
                                                      style:
                                                      Stylings.navSmall,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: SizeConfig.h(40),
                                                  width: SizeConfig.w(40),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                      30,
                                                    ),
                                                    color: Stylings.priWhite
                                                        .withOpacity(0.2),
                                                    border: Border.all(
                                                      color:
                                                      Stylings.priWhite,
                                                      width: 0.5,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.favorite_border,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      // ListTile(
                                      //
                                      //   leading: Container(
                                      //     height: 277,
                                      //     width: 277.21,
                                      //     decoration: BoxDecoration(
                                      //       borderRadius: BorderRadius.circular(16.56),
                                      //       border: Border.all(color: Colors.red, width: 5, style: BorderStyle.solid),
                                      //       image: DecorationImage(image:AssetImage(wallpaper['poster'] as String), fit: BoxFit.cover )
                                      //     ),
                                      //     // child: Image(image: AssetImage(wallpaper['poster'] as String), fit: BoxFit.cover,),
                                      //   ),
                                      //   title:
                                      //   Column(
                                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      //     crossAxisAlignment: CrossAxisAlignment.start,
                                      //     children: [
                                      //       Text(wallpaper['name'] as String, style: TextStyle(
                                      //         fontFamily: 'Poppings',
                                      //         fontSize: 30,
                                      //         fontWeight: FontWeight.w500,
                                      //         color: Stylings.priBlack,
                                      //       ),
                                      //       ),
                                      //       Text(wallpaper['description'] as String, style: Stylings.cardSmall.copyWith(color: Stylings.priBlack),),
                                      //       Container(
                                      //         padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                                      //         height: 34,
                                      //         width: 110,
                                      //         decoration: BoxDecoration(
                                      //             color: Color(0xFF8787871A).withOpacity(0.1),
                                      //             borderRadius: BorderRadius.circular(30),
                                      //             border: Border.fromBorderSide(BorderSide(
                                      //                 color:  Stylings.priBlack.withOpacity(0.5),
                                      //                 width: 1,
                                      //                 style: BorderStyle.solid))
                                      //         ),
                                      //         child: Center(child: Text('${(wallpaper['designs'] as List).length} wallpapers', style: Stylings.navSmall.copyWith(color: Stylings.priWhite),)),
                                      //       )
                                      //     ],
                                      //   ),
                                      //   // subtitle: Column(
                                      //   //
                                      //   // ),
                                      // ),
                                    );

                                    //   WallpaperCard(
                                    //     picture: AssetImage(wallpaper['poster'] as String),
                                    //     name: wallpaper['name'] as String,
                                    //     description: wallpaper['description'] as String,
                                    //     content: (wallpaper['designs'] as List).length
                                    // );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: SizeConfig.padding(40, 40),
                        height: SizeConfig.h(746),
                        width: SizeConfig.w(661),
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.red, width: 5),
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white, Colors.white.withOpacity(0)],
                          ),
                          //color: Stylings.priWhite
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    // border: Border.all(color: Colors.red, width: 5),
                                  ),
                                  width: SizeConfig.w(279),
                                  height: SizeConfig.h(459),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Preview',
                                        style: Stylings.cardHeader.copyWith(
                                          fontSize: SizeConfig.sp(32),
                                          color: Stylings.priBlack,
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.h(37)),
                                      Container(
                                        height: SizeConfig.h(57),
                                        width: 96,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Name',
                                              style: Stylings.navSmall.copyWith(
                                                color: Color(0xFF808080),
                                              ),
                                            ),
                                            Text(
                                              (wallpapers[0]['designs']
                                              as List<
                                                  Map<String, String>
                                              >)[0]['title']!,
                                              style: Stylings.subHeader.copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.h(30),),
                                      Container(
                                        height: SizeConfig.h(54),
                                        width: SizeConfig.w(279),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Tags',
                                              style: Stylings.navSmall.copyWith(
                                                color: Color(0xFF808080),
                                              ),
                                            ),
                                            SizedBox(height: SizeConfig.h(4),),
                                            Container(
                                              height: SizeConfig.h(29),
                                              width: SizeConfig.w(279),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFBFBFBF).withOpacity(0.2),
                                                      borderRadius:
                                                      BorderRadius.circular(24),
                                                    ),
                                                    child: Text(
                                                      'Nature',
                                                      style: Stylings.navSmall,
                                                    ),
                                                  ),
                                                  SizedBox(width: SizeConfig.w(12),),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFBFBFBF).withOpacity(0.2),
                                                      borderRadius:
                                                      BorderRadius.circular(24),
                                                    ),
                                                    child: Text(
                                                      'Ambience',
                                                      style: Stylings.navSmall,
                                                    ),
                                                  ),
                                                  SizedBox(width: SizeConfig.w(12)),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFBFBFBF).withOpacity(0.2),
                                                      borderRadius:
                                                      BorderRadius.circular(24),
                                                    ),
                                                    child: Text(
                                                      'Flowers',
                                                      style: Stylings.navSmall,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.h(30),),
                                      Container(
                                        height: SizeConfig.h(126),
                                        width: SizeConfig.w(280.81),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Description',
                                              style: Stylings.navSmall.copyWith(
                                                color: Color(0xFF808080),
                                              ),
                                            ),
                                            ShaderMask(
                                              shaderCallback: (Rect bounds) {
                                                return const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Colors.black,
                                                    Colors.transparent,
                                                  ],
                                                  stops: [0.3, 1.0],
                                                ).createShader(bounds);
                                              },
                                              blendMode: BlendMode.dstIn,
                                              child: Text(
                                                'Discover the pure beauty of "Natural Essence" – your gateway to authentic, nature-inspired experiences. Let this unique collection elevate your senses and connect you with the unrefined elegance of the natural world. Embrace "Natural Essence" for a truly organic transformation in your daily life.', style: Stylings.navSmall.copyWith(fontWeight: FontWeight.w500),
                                                maxLines: 5,
                                                overflow: TextOverflow.fade,),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.h(37)),
                                      Container(
                                        height: SizeConfig.h(40),
                                        width: SizeConfig.w(144),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: SizeConfig.h(40),
                                              width: SizeConfig.w(40),

                                              //padding: EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(11),
                                                  color: Color(0xFF7C7C7C).withOpacity(0.1),
                                                  border: Border.all(color: Color(0xFFE5E5E5), width: 0.5)
                                              ),
                                              child: Center(child: Icon(Icons.ios_share_outlined,)),
                                            ),
                                            SizedBox(width: SizeConfig.w(12),),
                                            Container(
                                              padding: EdgeInsets.all(6),
                                              height: SizeConfig.h(40),
                                              width: SizeConfig.w(40),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(11),
                                                  color: Color(0xFF7C7C7C).withOpacity(0.1),
                                                  border: Border.all(color: Color(0xFFE5E5E5), width: 0.5)
                                              ),
                                              child: Image(image: AssetImage('assets/images/group.png'), fit: BoxFit.contain,),
                                            ),
                                            SizedBox(width:SizeConfig.w(12),),
                                            Container(
                                              height: SizeConfig.h(40),
                                              width: SizeConfig.w(40),
                                              // padding: SizeConfig.padding(6.53, 6.53),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(11),
                                                  color: Color(0xFF7C7C7C).withOpacity(0.1),
                                                  border: Border.all(color: Color(0xFFE5E5E5), width: 0.5)
                                              ),
                                              child: Center(child: Icon(Icons.settings_outlined, size: 20)),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: Get.height * 0.51, //SizeConfig.h(524.99),
                                  width:  Get.width * 0.17,//SizeConfig.w(258.04),
                                  decoration: BoxDecoration(
                                    border: Border.fromBorderSide(
                                      BorderSide(
                                        strokeAlign: BorderSide.strokeAlignOutside,
                                        color: Stylings.priBlack,
                                        width: 3.31,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/active.jpg'),
                                      // AssetImage('assets/images/nature.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(35.5),
                                  ),
                                  child: Stack(
                                    children: [
                                      // Image(image: AssetImage(
                                      //     'assets/images/active.jpg'),
                                      //     // AssetImage('assets/images/nature.png'),
                                      //     fit: BoxFit.fill),
                                      //   Container(
                                      //   height: Get.height * 0.65,
                                      //   width: Get.width * 0.17,
                                      //   decoration: BoxDecoration(
                                      //       border: Border.fromBorderSide(BorderSide(
                                      //           strokeAlign: BorderSide.strokeAlignOutside,
                                      //           color: Color(0xFFE3E3E3),
                                      //           width: 3,
                                      //           style: BorderStyle.solid)),
                                      //       image: DecorationImage(image: AssetImage(
                                      //           'assets/images/active.jpg'),
                                      //           // AssetImage('assets/images/nature.png'),
                                      //           fit: BoxFit.fill),
                                      //       borderRadius: BorderRadius.circular(26)
                                      //   ),
                                      // ),
                                      Align(
                                        alignment: Alignment(0, -0.95),
                                        child:
                                        Container(
                                          height: SizeConfig.h(20.88),
                                          width: SizeConfig.w(72.36),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              26.47,
                                            ),
                                            color: Stylings.priBlack,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                height: SizeConfig.h(10.13),
                                                width: SizeConfig.w(10.13),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(
                                                    26.47,
                                                  ),
                                                  //color: Colors.white
                                                  color: Color(0xFF2A2A2A),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(0, 0.9),
                                        child: Container(
                                          height: SizeConfig.h(2.58),
                                          width:SizeConfig.w(84.05),
                                          decoration: BoxDecoration(
                                              color: Color(0xFFD9D9D9),
                                              borderRadius: BorderRadius.circular(30.61)
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                // decoration: BoxDecoration(
                                //   border: Border.all(color: Colors.red, width:5)
                                // ),
                                height: SizeConfig.h(50),
                                width: SizeConfig.w(420),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: SizeConfig.h(50),
                                        width: SizeConfig.h(200),
                                        padding: SizeConfig.padding(10, 10),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFF8F8F8),
                                            borderRadius: BorderRadius.circular(21),
                                            border: Border.all(
                                                color: Color(0xFFDFDFDF),
                                                width: 1,
                                                strokeAlign: BorderSide.strokeAlignInside
                                            )
                                        ),
                                        child: Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.favorite_border, size: SizeConfig.sp(18),),
                                            SizedBox(width: SizeConfig.w(10),),
                                            Center(child: Text('Save to Favorites', style: Stylings.navSmall.copyWith(fontWeight: FontWeight.w500),))
                                          ],
                                        ),
                                      ),
                                      SizedBox(width:SizeConfig.w(20)),
                                      Container(
                                          height: SizeConfig.h(50),
                                          width: SizeConfig.h(200),
                                          padding: SizeConfig.padding(10,10),
                                          decoration: BoxDecoration(
                                              color: Color(0xFFFBB03B),
                                              borderRadius: BorderRadius.circular(21),
                                              border: Border.all(
                                                  color: Color(0xFFDFDFDF),
                                                  width: 1,
                                                  strokeAlign: BorderSide.strokeAlignInside
                                              )
                                          ),
                                          child:
                                          Center(child: Text('Save to Wallpaper',style: Stylings.navSmall.copyWith(fontWeight: FontWeight.w500, color: Stylings.priWhite),))
                                      ),

                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                   color: Colors.black.withOpacity(0.7),
                  // child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0) ),
                ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: SizeConfig.padding(37, 37),
                      // height: SizeConfig.h(1070),
                      width: SizeConfig.w(656),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // borderRadius: const BorderRadius.only(
                        //   topLeft: Radius.circular(20),
                        //   bottomLeft: Radius.circular(20),
                        // ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(-4, 0),
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: SizeConfig.h(65),
                              width: SizeConfig.w(569),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Wallpaper Setup', style: Stylings.subHeader.copyWith(fontWeight: FontWeight.w500),),
                                  SizedBox(height:SizeConfig.h(8)),
                                  Text('Configure your wallpaper settings and enable auto-rotation', style: Stylings.navSmall,)
                                ],
                              ),
                            ),
                            SizedBox(height: SizeConfig.h(26)),
                            Container(
                              padding: SizeConfig.padding(20, 20),
                              height: SizeConfig.h(120),
                              width: SizeConfig.w(569),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(SizeConfig.sp(16)),
                                  border: Border.all(width: 1, color: Color(0x000000).withOpacity(0.1),strokeAlign: BorderSide.strokeAlignInside)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Activate Wallpaper', style: Stylings.subHeader.copyWith(fontWeight: FontWeight.w500,fontSize: SizeConfig.sp(20))),
                                      SizedBox(height:SizeConfig.h(8),),
                                      Text('Set the selected wallpaper as your desktop background', style: Stylings.navSmall.copyWith(color: Color(0xFF9C9C9C)))
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      padding: SizeConfig.padding(20, 10),
                                      height: SizeConfig.h(44),
                                      width: SizeConfig.w(144),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFC8FFBD,),
                                          borderRadius: BorderRadius.circular(SizeConfig.sp(38)),
                                          // border: Border.all(width: 1, color: Color(0xFFFFA821),strokeAlign: BorderSide.strokeAlignInside)
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.check_circle, color: Color(0xFF1BA400),size: SizeConfig.sp(18),),
                                            SizedBox(width: SizeConfig.w(10)),
                                            Text('Activated', style:TextStyle(
                                              fontFamily: 'Poppings',
                                              fontSize: SizeConfig.sp(14),
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF1BA400),
                                            ))
                                          ],
                                        ),
                                      )
                                      
                        
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: SizeConfig.h(26)),
                            Container(
                              height: SizeConfig.h(342),
                              width: SizeConfig.w(569),
                              // decoration: BoxDecoration(
                              //   border: Border.all(color: Colors.red)
                              // ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Dsiplay mode', style: Stylings.subHeader.copyWith(fontSize: SizeConfig.sp(20)),),
                                  SizedBox(height: SizeConfig.h(8)),
                                  Container(
                                    padding: SizeConfig.padding(20, 10),
                                    height: SizeConfig.h(69),
                                    width: SizeConfig.w(569),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(SizeConfig.sp(16)),
                                        border: Border.all(width: 1, color: Color(0x000000).withOpacity(0.1),strokeAlign: BorderSide.strokeAlignInside)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: SizeConfig.h(24),
                                            width: SizeConfig.w(24),
                                            child: Center(child: Image(image: AssetImage('assets/images/circleicon.png'), fit: BoxFit.contain,))),
                                        SizedBox(width: SizeConfig.w(16),),
                                        Container(
                                          height: SizeConfig.h(49),
                                          width: SizeConfig.w(196),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Fit', style: TextStyle(
                                                fontFamily: 'Poppings',
                                                fontSize: SizeConfig.sp(16),
                                                fontWeight: FontWeight.w500,
                                                color: Stylings.priBlack,
                                              )),
                                              Text('Scale to fit without cropping', style:TextStyle(
                                                fontFamily: 'Poppings',
                                                fontSize: SizeConfig.sp(14),
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF9C9C9C),
                                              ))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                        
                                  ),
                                  SizedBox(height: SizeConfig.h(8)),
                                  Container(
                                    padding: SizeConfig.padding(20, 10),
                                    height: SizeConfig.h(69),
                                    width: SizeConfig.w(569),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(SizeConfig.sp(16)),
                                        border: Border.all(width: 1, color: Color(0x000000).withOpacity(0.1),strokeAlign: BorderSide.strokeAlignInside)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: SizeConfig.h(24),
                                            width: SizeConfig.w(24),
                                            child: Center(child: Icon(Icons.circle_outlined, size: SizeConfig.sp(24), color: Color(0xFFD8D8D8),))),
                                        SizedBox(width: SizeConfig.w(16),),
                                        Container(
                                          height: SizeConfig.h(49),
                                          width: SizeConfig.w(196),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Fill', style: TextStyle(
                                                fontFamily: 'Poppings',
                                                fontSize: SizeConfig.sp(16),
                                                fontWeight: FontWeight.w500,
                                                color: Stylings.priBlack,
                                              )),
                                              Text('Scale to fill the entire screen', style:TextStyle(
                                                fontFamily: 'Poppings',
                                                fontSize: SizeConfig.sp(14),
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF9C9C9C),
                                              ))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                        
                                  ),
                                  SizedBox(height: SizeConfig.h(8)),
                                  Container(
                                    padding: SizeConfig.padding(20, 10),
                                    height: SizeConfig.h(69),
                                    width: SizeConfig.w(569),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(SizeConfig.sp(16)),
                                        border: Border.all(width: 1, color: Color(0x000000).withOpacity(0.1),strokeAlign: BorderSide.strokeAlignInside)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: SizeConfig.h(24),
                                            width: SizeConfig.w(24),
                                            child: Center(child: Icon(Icons.circle_outlined, size: SizeConfig.sp(24), color: Color(0xFFD8D8D8),))),
                                        SizedBox(width: SizeConfig.w(16),),
                                        Container(
                                          height: SizeConfig.h(49),
                                          width: SizeConfig.w(196),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Stretch', style: TextStyle(
                                                fontFamily: 'Poppings',
                                                fontSize: SizeConfig.sp(16),
                                                fontWeight: FontWeight.w500,
                                                color: Stylings.priBlack,
                                              )),
                                              Text('Stretch to Fill the Screen', style:TextStyle(
                                                fontFamily: 'Poppings',
                                                fontSize: SizeConfig.sp(14),
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF9C9C9C),
                                              ))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                        
                                  ),
                                  SizedBox(height: SizeConfig.h(8)),
                                  Container(
                                    padding: SizeConfig.padding(20, 10),
                                    height: SizeConfig.h(69),
                                    width: SizeConfig.w(569),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(SizeConfig.sp(16)),
                                        border: Border.all(width: 1, color: Color(0x000000).withOpacity(0.1),strokeAlign: BorderSide.strokeAlignInside)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: SizeConfig.h(24),
                                            width: SizeConfig.w(24),
                                            child: Center(child: Icon(Icons.circle_outlined, size: SizeConfig.sp(24), color: Color(0xFFD8D8D8),))),
                                        SizedBox(width: SizeConfig.w(16),),
                                        Container(
                                          height: SizeConfig.h(49),
                                          width: SizeConfig.w(196),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Tile', style: TextStyle(
                                                fontFamily: 'Poppings',
                                                fontSize: SizeConfig.sp(16),
                                                fontWeight: FontWeight.w500,
                                                color: Stylings.priBlack,
                                              )),
                                              Text('Repeat the Image to Fill the screen', style:TextStyle(
                                                fontFamily: 'Poppings',
                                                fontSize: SizeConfig.sp(14),
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF9C9C9C),
                                              ))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                        
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: SizeConfig.h(26)),
                            Container(
                              padding: SizeConfig.padding(20, 10),
                              height: SizeConfig.h(92),
                              width: SizeConfig.w(569),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(SizeConfig.sp(16)),
                                  border: Border.all(width: 1, color: Color(0xFFE5E5E5),strokeAlign: BorderSide.strokeAlignInside)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Auto - Rotation', style: TextStyle(
                                        fontFamily: 'Poppings',
                                        fontSize: SizeConfig.sp(16),
                                        fontWeight: FontWeight.w500,
                                        color: Stylings.priBlack,
                                      )),
                                      SizedBox(height:SizeConfig.h(4),),
                                      Text('Automatically change your wallpaper at regular intervals', style: Stylings.navSmall.copyWith(color: Color(0xFF9C9C9C)))
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      padding: SizeConfig.padding(2, 2),
                                      height: SizeConfig.h(21.27),
                                      width: SizeConfig.w(38.54),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFBB03B,),
                                          borderRadius: BorderRadius.circular(SizeConfig.sp(15)),
                                          border: Border.all(width: 1, color: Color(0xFFFFA821),strokeAlign: BorderSide.strokeAlignInside)
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          height: SizeConfig.h(17.27),
                                          width: SizeConfig.w(17.27),
                                          decoration: BoxDecoration(
                                            color: Stylings.priWhite,
                                            borderRadius: BorderRadius.circular(SizeConfig.sp(15)),
                                            // border: Border.all(width: 1, color: Color(0xFFFFA821),strokeAlign: BorderSide.strokeAlignInside)
                                          ),
                        
                                        ),
                                      ),
                        
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: SizeConfig.h(26)),
                            Container(
                              height: SizeConfig.h(184),
                              width: SizeConfig.w(569),
                              // decoration: BoxDecoration(
                              //   border: Border.all(color: Colors.red)
                              // ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Advanced Settings', style: Stylings.subHeader.copyWith(fontSize: SizeConfig.sp(20)),),
                                  SizedBox(height: SizeConfig.h(8)),
                                  Container(
                                    padding: SizeConfig.padding(20, 10),
                                    height: SizeConfig.h(69),
                                    width: SizeConfig.w(569),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(SizeConfig.sp(16)),
                                        border: Border.all(width: 1, color: Color(0x000000).withOpacity(0.1),strokeAlign: BorderSide.strokeAlignInside)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: SizeConfig.h(24),
                                            width: SizeConfig.w(24),
                                            child: Center(child: Image(image: AssetImage('assets/images/circleicon.png'), fit: BoxFit.contain,))),
                                        SizedBox(width: SizeConfig.w(16),),
                                        Container(
                                          height: SizeConfig.h(49),
                                          width: SizeConfig.w(196),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Lock Wallpaper', style: TextStyle(
                                                fontFamily: 'Poppings',
                                                fontSize: SizeConfig.sp(16),
                                                fontWeight: FontWeight.w500,
                                                color: Stylings.priBlack,
                                              )),
                                              Text('Prevent accidental changes', style:TextStyle(
                                                fontFamily: 'Poppings',
                                                fontSize: SizeConfig.sp(14),
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF9C9C9C),
                                              ))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                        
                                  ),
                                  SizedBox(height: SizeConfig.h(8)),
                                  Container(
                                    padding: SizeConfig.padding(20, 10),
                                    height: SizeConfig.h(69),
                                    width: SizeConfig.w(569),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(SizeConfig.sp(16)),
                                        border: Border.all(width: 1, color: Color(0x000000).withOpacity(0.1),strokeAlign: BorderSide.strokeAlignInside)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: SizeConfig.h(24),
                                            width: SizeConfig.w(24),
                                            child: Center(child: Icon(Icons.circle_outlined, size: SizeConfig.sp(24), color: Color(0xFFD8D8D8),))),
                                        SizedBox(width: SizeConfig.w(16),),
                                        Container(
                                          height: SizeConfig.h(49),
                                          width: SizeConfig.w(196),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Sync Across Devices', style: TextStyle(
                                                fontFamily: 'Poppings',
                                                fontSize: SizeConfig.sp(16),
                                                fontWeight: FontWeight.w500,
                                                color: Stylings.priBlack,
                                              )),
                                              Text('Keep wallpaper consistent on all devices', style:TextStyle(
                                                fontFamily: 'Poppings',
                                                fontSize: SizeConfig.sp(14),
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF9C9C9C),
                                              ))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                        
                                  ),
                        
                                ],
                              ),
                            ),
                            SizedBox(height: SizeConfig.h(26)),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                // decoration: BoxDecoration(
                                //   border: Border.all(color: Colors.red, width:5)
                                // ),
                                height: SizeConfig.h(50),
                                width: SizeConfig.w(569),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                          height: SizeConfig.h(50),
                                          width: SizeConfig.h(200),
                                          padding: SizeConfig.padding(10, 10),
                                          decoration: BoxDecoration(
                                              color: Color(0xFFF8F8F8),
                                              borderRadius: BorderRadius.circular(SizeConfig.sp(21)),
                                              border: Border.all(
                                                  color: Color(0xFFF8F8F8),
                                                  width: 1,
                                                  strokeAlign: BorderSide.strokeAlignInside
                                              )
                                          ),
                                          child: Center(child: Text('Cancel', style: Stylings.navSmall.copyWith(fontWeight: FontWeight.w500),))

                                      ),
                                      SizedBox(width:SizeConfig.w(20)),
                                      GestureDetector(
                                        onTap:(){
                                          Get.to(()=>WallpaperSetup());
                                        },
                                        child: Container(
                                            height: SizeConfig.h(50),
                                            width: SizeConfig.h(200),
                                            padding: SizeConfig.padding(10,10),
                                            decoration: BoxDecoration(
                                                color: Color(0xFFFBB03B),
                                                borderRadius: BorderRadius.circular(21),
                                                border: Border.all(
                                                    color: Color(0xFFDFDFDF),
                                                    width: 1,
                                                    strokeAlign: BorderSide.strokeAlignInside
                                                )
                                            ),
                                            child:
                                            Center(child: Text('Save Settings',style: Stylings.navSmall.copyWith(fontWeight: FontWeight.w500, color: Stylings.priWhite),))
                                        ),
                                      ),

                                    ]),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

