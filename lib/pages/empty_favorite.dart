import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wallpaper_app/pages/active_wallpaper.dart';
import 'package:wallpaper_app/pages/favorite_page.dart';
import 'package:wallpaper_app/pages/settings.dart';

import '../reusables/mybutton.dart';
import '../reusables/stylings.dart';
import '../utils/size_config.dart';
import 'browse_pages.dart';
import 'home_page.dart';

class EmptyFavorite extends StatelessWidget {
  EmptyFavorite({super.key});

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
          Padding(
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
                    'Your Saved Wallpaper Collection',
                    style: Stylings.subHeader.copyWith(color: Color(0xFF575757)),
                  ),
                ),
                SizedBox(height:SizeConfig.h(144)),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: SizeConfig.h(374.29),
                    width: SizeConfig.w(379),
                    child: Column(
                      children: [
                        Container(
                          height: SizeConfig.h(185.29),
                          width: SizeConfig.w(197.57),
                          child: Image(image: AssetImage('assets/images/empty.png'), fit: BoxFit.contain,),
                        ),
                        SizedBox(height: SizeConfig.h(50),),
                        Container(
                          height: SizeConfig.h(139),
                          width: SizeConfig.w(379),
                          child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('No Saved Wallpapers', style: TextStyle(
                                fontFamily: 'Poppings',
                                fontSize: SizeConfig.sp(24),
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF575757),
                              ),),
                              Text('Start saving your favorite wallpapers to see them here', style: Stylings.navSmall.copyWith(color: Color(0xFF575757)),),
                              GestureDetector(
                                onTap: (){
                                  Get.to(()=>FavoritePage());
                                },
                                child: Container(
                                  height: SizeConfig.h(50),
                                  width: SizeConfig.w(200),
                                  decoration: BoxDecoration(
                                    color: Stylings.selected,
                                    borderRadius: BorderRadius.circular(SizeConfig.sp(21)),
                                  ),

                                  child: Center(
                                    child: Text('Browse Wallpapaers', style: TextStyle(
                                      fontFamily: 'Poppings',
                                      fontSize: SizeConfig.sp(14),
                                      fontWeight: FontWeight.w500,
                                      color: Stylings.priWhite,
                                    ),),
                                  ),
                                ),
                              )
                            ],
                          ),


                        )

                      ],
                    ),

                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
