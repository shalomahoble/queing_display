// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:queing_display/views/home.dart';
import 'package:queing_display/views/listing_direction.dart';
import 'package:queing_display/views/listing_sites.dart';

class AppRoutes {
  static const String HOMEPAGE = "/home";
  static const String LISTEDIRECTIONS = "/listedirections";
  static const String LISTESITES = "/listesites";

  static List<GetPage> routes = [
    GetPage(
      name: HOMEPAGE,
      page: () => const Home(),
    ),
    GetPage(
      name: LISTEDIRECTIONS,
      page: () => const ListingDirection(),
    ),
    GetPage(
      name: LISTESITES,
      page: () => const ListingSite(),
    ),
  ];
}
