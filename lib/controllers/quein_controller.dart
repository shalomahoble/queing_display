import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queing_display/models/client.dart';
import 'package:queing_display/models/direcrion.dart';
import 'package:queing_display/models/site.dart';
import 'package:queing_display/services/queing_service.dart';

class QueinController extends GetxController {
  final _queingService = Get.put(QueingService());
  RxBool loading = false.obs;
  RxBool loadingSite = false.obs;
  RxList<Direction> allDirections = <Direction>[].obs;
  RxList<Direction> filteredDirections = <Direction>[].obs;

  RxList<Site> allSites = <Site>[].obs;
  RxList<Site> filteredSites = <Site>[].obs;

  RxList<Client> client = <Client>[].obs;
  RxList<Client> clientAnimatedListe = <Client>[].obs;

  final Rx<TextEditingController> searchDirectionController =
      TextEditingController().obs;

  final Rx<TextEditingController> searchSiteController =
      TextEditingController().obs;

  //Function to get all directions
  Future<void> getAllDirections() async {
    try {
      final response = await _queingService.getAllDirectons();
      if (response.statusCode == 200) {
        final body = response.body;
        allDirections.value = body["directions"]
            .map<Direction>((el) => Direction.fromJson(el))
            .toList();
        filteredDirections.value = allDirections;
        loading(true);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  //Function to search in the direction liste
  void searchDirection(String query) {
    _filterDirections(query);
    // Pas besoin de setState, GetX se met à jour automatiquement
  }

  void _filterDirections(String query) {
    if (query.isEmpty) {
      // Si le champ de recherche est vide, afficher la liste complète
      filteredDirections.value = allDirections;
      update();
    } else {
      // Filtrer la liste en fonction du texte de recherche
      filteredDirections.value = allDirections.where((direction) {
        return direction.libelle.toLowerCase().contains(query.toLowerCase());
      }).toList();
      update();
    }
  }

  //########################### SITES FUNTIONS #####################################
  // ignore: non_constant_identifier_names
  Future<void> getAllSiteForDirection(int IdDirection) async {
    try {
      final response = await _queingService.getAllSites(IdDirection);
      if (response.statusCode == 200) {
        final body = response.body;
        allSites.value =
            body["sites"].map<Site>((el) => Site.fromJson(el)).toList();
        filteredSites.value = allSites;
        loadingSite(true);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // Search function for site
  void searchSite(String query) {
    _filterSite(query);
  }

  void _filterSite(String query) {
    if (query.isEmpty) {
      // Si le champ de recherche est vide, afficher la liste complète
      filteredSites.value = allSites;
      update();
    } else {
      // Filtrer la liste en fonction du texte de recherche
      filteredSites.value = allSites.where((site) {
        return site.libelle.toLowerCase().contains(query.toLowerCase());
      }).toList();
      update();
    }
  }

  // Get Ticket for site

  Future<void> getAllTocket() async {
    try {
      final response = await _queingService.getAllTicket();
      if (response.statusCode == 200) {
        client.value = response.body["clients"]
            .map<Client>((el) => Client.fromJson(el))
            .toList();
        clientAnimatedListe.value = client;
      }
    } catch (e) {
      print('erreur get All ticket $e');
    }
  }

  void deleteTiclet(int id) {
    client.removeWhere((el) => el.id == id);
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("On init ...");
    getAllDirections();
  }
}
