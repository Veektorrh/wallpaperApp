import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../global_variables.dart';
import '../reusables/mybutton.dart';
import '../reusables/stylings.dart';
import '../reusables/wallpaper_card.dart';
import '../utils/size_config.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    final LinearGradient gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color(0xFFFBB03B), Color(0xFFEC0C43)],
    );
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
                Mybutton(
                  bText: 'Home',
                  isActive: false,

                  picture: AssetImage('assets/images/homeicon.png'),
                ),
                SizedBox(width: SizeConfig.w(12)),
                Mybutton(
                  bText: 'Browse',

                  picture: AssetImage('assets/images/browseicon.png'),
                ),
                SizedBox(width:SizeConfig.w(12)),
                Mybutton(
                  bText: 'Favorite',
                  isActive: false,
                  picture: AssetImage('assets/images/favicon.png'),
                ),
                SizedBox(width: SizeConfig.w(12)),
                Mybutton(
                  bText: 'Settings',
                  isActive: false,
                  picture: AssetImage('assets/images/settingsicon.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
// SizedBox(height: 50,),
          Expanded(
            child: Padding(
              padding: SizeConfig.padding(47, 47),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  'Browse Categories',
                                  style: Stylings.headerLarge,
                                ),
                              ),
                            ),

                            Align(
                              alignment: Alignment(-1, -1),
                              child: Text(
                                'Explore our curated collections of stunning wallpapers', style: Stylings.subHeader,

                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment(1, 1),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isGridView = !isGridView;
                            });
                          },
                          child: isGridView ? ImageIcon(AssetImage('assets/images/listicon.png'),size: SizeConfig.sp(27), color: Stylings.selected,) : ImageIcon(AssetImage('assets/images/gridicon.png'), size: SizeConfig.sp(27), color: Stylings.selected)
                          // isGridView ? ImageIcon(AssetImage('assets/images/listicon.png')) : Icons.grid_view_outlined
                            // child: isGridView ? ImageIcon (Image: AssetImage('assets/images/listicon')) : Icons.grid_view_outlined, size: 27,color: Stylings.selected,))

                      ))
                    ],
                  ),
                  SizedBox(height: SizeConfig.h(50),),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text('Categories', style: TextStyle(fontFamily: 'Poppins', fontSize: 32, fontWeight: FontWeight.w500),),
                  //     Text('See All', style: Stylings.subHeader,)
                  //   ],
                  // ),
                  // SizedBox(height: 23,),
                  Expanded(
                    child:AnimatedSwitcher(
                      duration: Duration(milliseconds: 1000),
                      child: isGridView ? GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: wallpapers.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 23,
                              childAspectRatio: 1.5,
                              crossAxisSpacing: 20,
                              crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            final wallpaper = wallpapers[index];
                            return WallpaperCard(
                                picture: AssetImage(wallpaper['poster'] as String),
                                name: wallpaper['name'] as String,
                                description: wallpaper['description'] as String,
                                content: (wallpaper['designs'] as List).length
                            );
                          }) :
                          ListView.builder(
                              itemCount: wallpapers.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                final wallpaper = wallpapers[index];
                                return Padding(
                                  padding: SizeConfig.padding(0, 20),
                                  child: Container(
                                    height: SizeConfig.h(225.12),
                                    width: SizeConfig.w(1346),
                                    // padding: EdgeInsets.symmetric(vertical: 20),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Stylings.priBlack.withOpacity(0.1),
                                          width: 1,
                                          strokeAlign: BorderSide.strokeAlignInside
                                        ),
                                      )
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                      Container(
                                          height: SizeConfig.h(185.12),
                                          width: SizeConfig.h(277.21),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16.56),
                                            // border: Border.all(color: Colors.red, width: 5, style: BorderStyle.solid),
                                            image: DecorationImage(image:AssetImage(wallpaper['poster'] as String), fit: BoxFit.fill )
                                          ),),
                                SizedBox(width: SizeConfig.w(20)),
                                Container(
                                  height: SizeConfig.h(126),
                                  width: SizeConfig.w(277),

                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(wallpaper['name'] as String, style: TextStyle(
                                          fontFamily: 'Poppings',
                                          fontSize: SizeConfig.sp(30),
                                          fontWeight: FontWeight.w500,
                                          color: Stylings.priBlack,
                                        ),
                                        ),
                                        Text(wallpaper['description'] as String, style: Stylings.cardSmall.copyWith(color: Stylings.priBlack),),
                                        Container(
                                          //padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                                          height: SizeConfig.h(34),
                                          width: SizeConfig.w(110),
                                          // padding: SizeConfig.padding(10,12),
                                          decoration: BoxDecoration(

                                              color: Color(0xFF878787).withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(SizeConfig.sp(30)),
                                              border: Border.fromBorderSide(BorderSide(
                                                  color:  Stylings.priBlack.withOpacity(0.05),
                                                  width: 1,
                                                  ))
                                          ),
                                          child: Center(child: Text('${(wallpaper['designs'] as List).length} wallpapers', style: Stylings.navSmall,)),
                                        )
                                      ],
                                    ),
                                ),

                                      ],
                                    )
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
                                  ),
                                );
                      
                                //   WallpaperCard(
                                //     picture: AssetImage(wallpaper['poster'] as String),
                                //     name: wallpaper['name'] as String,
                                //     description: wallpaper['description'] as String,
                                //     content: (wallpaper['designs'] as List).length
                                // );
                              }),
                    )
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
    );;
  }
}
