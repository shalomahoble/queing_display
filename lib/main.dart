import 'package:flutter/material.dart';
import 'package:queing_display/config/app_style.dart';
import 'package:queing_display/views/home.dart';
import 'package:queing_display/views/listing_direction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Queing Display',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: KOrange),
        useMaterial3: true,
      ),
      home: const ListingDirection(),
    );
  }
}
