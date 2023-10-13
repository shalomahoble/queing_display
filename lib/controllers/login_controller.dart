import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:queing_display/models/site.dart';
import 'package:queing_display/services/queing_service.dart';
import 'package:queing_display/views/liste_ticketing.dart';

class LoginController extends GetxController {
  final QueingService _queingService = QueingService();
  final box = GetStorage();

  RxBool loading = RxBool(false);
  Rx<Site> site = Site(id: 0, libelle: 'libelle', image: 'image').obs;

  Future<void> login({required String code, required String password}) async {
    try {
      loading(true);
      final response = await _queingService.loginTv(
        code: code,
        password: password,
      );
      if (response.statusCode == 200) {
        // enregistre le token du site
        box.write("token", response.body['token']);
        site.value = Site.fromJson(response.body['site']);
        box.write("site", site.value.id); //Enregistre l'id du site
        Get.offAll(const ListeTicketing());
        loading(false);
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }
}
