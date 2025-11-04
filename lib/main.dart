import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/pages/active_wallpaper.dart';
import 'package:wallpaper_app/pages/browse_pages.dart';
import 'package:wallpaper_app/pages/empty_favorite.dart';
import 'package:wallpaper_app/pages/favorite_page.dart';
import 'package:wallpaper_app/pages/home_page.dart';
import 'package:wallpaper_app/pages/settings.dart';
import 'package:wallpaper_app/pages/wallpaper_details.dart';
import 'package:wallpaper_app/pages/wallpaper_setup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WallPaper App',
      home: HomePage()
    );
  }
}


