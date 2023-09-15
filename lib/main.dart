import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:queing_display/config/app_routes.dart';
import 'package:queing_display/config/app_style.dart';
import 'package:queing_display/controllers/all_controller_binding.dart';
import 'package:queing_display/views/home.dart';
import 'package:queing_display/views/listing_direction.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    box.remove('site');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Queing Display',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: KOrange),
        useMaterial3: true,
      ),
      /*  home: const ListingDirection(), */
      home: box.hasData("site") ? Home() : const ListingDirection(),
      getPages: AppRoutes.routes,
      initialBinding: AllControllerBinding(),
    );
  }
}
