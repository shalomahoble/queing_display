import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:queing_display/config/app_routes.dart';
import 'package:queing_display/config/app_style.dart';
import 'package:queing_display/controllers/all_controller_binding.dart';
import 'package:queing_display/firebase_options.dart';
import 'package:queing_display/views/home.dart';
import 'package:queing_display/views/listing_direction.dart';
import 'package:intl/date_symbol_data_local.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log("event   $message");
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  initializeDateFormatting('fr_FR', null);
  /*  final box = GetStorage();
 */

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /* await FirebaseMessaging.instance.getToken().then((value) async {
    await box.write('fcmToken', value);
  }); */

  FirebaseMessaging.onBackgroundMessage((_firebaseMessagingBackgroundHandler));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscribeToTopicHelloWorld();
    /* _receiveMessageFirebase(); */
  }

  // This widget is the root of your application.
  Future<void> subscribeToTopicHelloWorld() async {
    await FirebaseMessaging.instance.subscribeToTopic("queuing");
  }

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    /* box.remove('site'); */
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Queing Display',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: KOrange),
        useMaterial3: true,
      ),
      /*  home: const ListingDirection(), */
      home: box.hasData("site") ? const Home() : const ListingDirection(),
      getPages: AppRoutes.routes,
      initialBinding: AllControllerBinding(),
    );
  }
}
