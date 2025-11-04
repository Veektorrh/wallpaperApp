import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wallpaper_app/pages/active_wallpaper.dart';

import '../reusables/mybutton.dart';
import '../reusables/stylings.dart';
import '../utils/size_config.dart';
import 'browse_pages.dart';
import 'empty_favorite.dart';
import 'home_page.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  final LinearGradient gradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFFFBB03B), Color(0xFFEC0C43)],
  );

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
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
                      'Settings',
                      style: Stylings.headerLarge,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-1, -1),
                  child: Text(
                    'Customize Your Wallpaper Studio Experience',
                    style: Stylings.subHeader.copyWith(color: Color(0xFF575757)),
                  ),
                ),
                SizedBox(height:SizeConfig.h(50)),
                Container(
                  padding: SizeConfig.padding(151, 35),
                  height: SizeConfig.h(628),
                  width: SizeConfig.w(1343),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SizeConfig.sp(36)),
                    color: Stylings.priWhite,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: SizeConfig.h(399),
                        width: SizeConfig.w(569),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(SizeConfig.sp(36)),
                          // border: Border.all(color: Colors.red)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Wallpaper Setup', style: Stylings.subHeader.copyWith(fontWeight: FontWeight.w500),),
                                  SizedBox(height:SizeConfig.h(8),),
                                  Text('Configure your wallpaper settings and enable auto-rotation', style: Stylings.navSmall,)
                                ],
                              ),
                            ),
                            SizedBox(height:SizeConfig.h(26),),
                            Container(
                              padding: SizeConfig.padding(20, 20),
                              height: SizeConfig.h(114),
                              width: SizeConfig.w(569),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(SizeConfig.sp(16)),
                                border: Border.all(width: 1, color: Color(0xFFE5E5E5),strokeAlign: BorderSide.strokeAlignInside)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Image Quality', style: Stylings.subHeader.copyWith(fontSize: SizeConfig.sp(20)),),
                                  Container(
                                    padding: SizeConfig.padding(10, 6),
                                    height: SizeConfig.h(36),
                                    width: SizeConfig.w(529),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(SizeConfig.sp(7)),
                                        border: Border.all(width: 1, color: Color(0xFFE5E5E5),strokeAlign: BorderSide.strokeAlignInside)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('High ( Best Quality )',style: Stylings.navSmall.copyWith(color: Color(0xFF9C9C9C)),),
                                        Icon(Icons.keyboard_arrow_down_outlined, size: SizeConfig.sp(24),)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height:SizeConfig.h(26),),
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
                                      Text('Notification', style: Stylings.subHeader.copyWith(fontSize: SizeConfig.sp(20))),
                                      SizedBox(height:SizeConfig.h(4),),
                                      Text('Get notified about new wallpapers and updates', style: Stylings.navSmall.copyWith(color: Color(0xFF9C9C9C)))
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
                            SizedBox(height:SizeConfig.h(26),),
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
                                          Center(child: Text('Save Settings',style: Stylings.navSmall.copyWith(fontWeight: FontWeight.w500, color: Stylings.priWhite),))
                                      ),

                                    ]),
                              ),
                            ),
                          ],
                        ),

                        // child: Image(image: AssetImage('assets/images/empty.png'), fit: BoxFit.contain,),
                      ),
                      SizedBox(height: SizeConfig.h(214),),
                      Container(
                        height: SizeConfig.h(524.99),
                        width: SizeConfig.w(258.04),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(SizeConfig.sp(35.57)),
                          color: Stylings.priWhite,
                          border: Border.all(color: Color(0xFFBABABA), width: SizeConfig.sp(3.31) )
                        ),
                        child:
                        Stack(
                          children: [
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
                              alignment: Alignment(0, 0),
                              child: Container(
                                height: SizeConfig.h(73),
                                width: SizeConfig.w(185),
                                child: Column(
                                children: [
                                  Container(
                                    padding: SizeConfig.padding(10, 10),
                                    height: SizeConfig.h(44),
                                    width: SizeConfig.w(181),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFCFFFC3),
                                      borderRadius: BorderRadius.circular(SizeConfig.sp(21)),
                                    ),

                                    child:Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image(image: AssetImage('assets/images/connecticon.png'), color: Color(0xFF168200),),
                                          SizedBox(width: SizeConfig.w(8)),
                                          Text('Connected to device', style: TextStyle(
                                            fontFamily: 'Poppings',
                                            fontSize: SizeConfig.sp(12),
                                            fontWeight: FontWeight.w600,
                                            color: Stylings.priWhite,
                                          ).copyWith(color: Color(0xFF168200))
                                            ,)
                                        ],
                                      ),
                                    )
                                    // Center(
                                    //   child: Text('Browse Wallpapaers', style: TextStyle(
                                    //     fontFamily: 'Poppings',
                                    //     fontSize: SizeConfig.sp(14),
                                    //     fontWeight: FontWeight.w500,
                                    //     color: Stylings.priWhite,
                                    //   ),),
                                    // ),
                                  ),
                                  Text('Click to Disconnect', style: TextStyle(
                                    fontFamily: 'Poppings',
                                    fontSize: SizeConfig.sp(12),
                                    fontWeight: FontWeight.w500,
                                    color: Stylings.priBlack,
                                  ),)
                                ],
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


                      )

                    ],
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
