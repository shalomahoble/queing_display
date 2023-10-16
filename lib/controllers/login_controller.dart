import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:queing_display/models/alerte.dart';
import 'package:queing_display/models/site.dart';
import 'package:queing_display/services/queing_service.dart';
import 'package:queing_display/views/liste_ticketing.dart';

class LoginController extends GetxController {
  final QueingService _queingService = QueingService();
  final box = GetStorage();

  RxBool loading = RxBool(false);
  Rx<Site> site = Site(id: 0, libelle: 'libelle', image: 'image').obs;
  RxList<Alerte> alerte = RxList.empty();

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
        alerte.value = response.body['alertes']
            .map<Alerte>((el) => Alerte.fromJson(el))
            .toList();
        // log(alerte.toString());
        box.write("site", site.value.id); //Enregistre l'id du site
        Get.offAll(const ListeTicketing());
        loading(false);
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }

  String getAlerteToText() {
    if (alerte.isNotEmpty) {
      return alerte.map((e) => e.libelle).toList().join(" | ");
    } else {
      return '';
    }
  }

  Future<void> getNewAlerte() async {
    try {
      final response = await _queingService.getAllAlerte();
      if (response.statusCode == 200) {
        alerte.value = response.body['alertes']
            .map<Alerte>((el) => Alerte.fromJson(el))
            .toList();
        update();
      } else {}
    } catch (e) {
      rethrow;
    }
  }
}
