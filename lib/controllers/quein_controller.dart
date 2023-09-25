import 'dart:async';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:queing_display/components/queing_display.dart';
import 'package:queing_display/models/client.dart';
import 'package:queing_display/models/direcrion.dart';
import 'package:queing_display/models/site.dart';
import 'package:queing_display/services/queing_service.dart';

class QueinController extends GetxController {
  final box = GetStorage();
  final _queingService = Get.put(QueingService());
  RxBool loading = false.obs;
  RxBool loadingSite = false.obs;
  RxList<Direction> allDirections = <Direction>[].obs;
  RxList<Direction> filteredDirections = <Direction>[].obs;

  RxList<Site> allSites = <Site>[].obs;
  RxList<Site> filteredSites = <Site>[].obs;

  RxList<Client> client = <Client>[].obs;
  RxList<Client> clientAnimatedListe = <Client>[].obs;
  Rx<Site> site =
      Site(id: 0, libelle: '', image: 'assets/images/error.png').obs;

  final Rx<TextEditingController> searchDirectionController =
      TextEditingController().obs;

  final Rx<TextEditingController> searchSiteController =
      TextEditingController().obs;

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  FlutterTts flutterTts = FlutterTts();

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

  Future<void> getAllTicket() async {
    try {
      final response = await _queingService.getAllTicket();
      if (response.statusCode == 200) {
        client.value = response.body["clients"]
            .map<Client>((el) => Client.fromJson(el))
            .toList();
        site.value = Site.fromJson(response.body["site"]);
        update();
      }
    } catch (e) {
      log('erreur get All ticket $e');
    }
  }

  Future<void> fetchNewTicket() async {
    final response = await _queingService.getAllTicket();
    if (response.statusCode == 200) {
      final newticket = response.body["clients"]
          .map<Client>((el) => Client.fromJson(el))
          .toList() as List<Client>;
      /* client.clear(); */
      final lastTicket = newticket[newticket.length - 1];
      if (!isPresent(lastTicket.id)) {
        client.add(lastTicket);
        listKey.currentState!.insertItem(newticket.length - 1,
            duration: const Duration(seconds: 3));
      }
      update();

      /* final phrase =
          "le Ticket ${lastTicket.numClient} est attendu a la ${lastTicket.caisse.libelle}";
      speak(phrase); */
    } else {
      log(response.body.toString());
    }
  }

  //Function to speak ...
  Future<void> speak(String text) async {
    await flutterTts.setLanguage("fr-FR"); // Choisissez la langue
    // Réglage de la hauteur de la voix (1.0 est la hauteur par défaut)
    await flutterTts.setPitch(1.0);
    // Réglage de la vitesse de la voix (1.0 est la vitesse par défaut)
    await flutterTts.setSpeechRate(.5);

    await flutterTts.speak(text); // Lecture du texte
  }

  //Verifie si l'id est present dans ma liste d'article
  bool isPresent(int id) {
    return client.any((el) => el.id == id);
  }

  void deleteTiclet(int id, int nextId) {
    if (client.isNotEmpty && isPresent(id)) {
      //Recuperer l'index du ticket
      final index = client.indexWhere((el) => el.id == id);
      //Suppression dans la liste a un index
      final removeItem = client.removeAt(index);
      listKey.currentState!.removeItem(
          index,
          (context, animation) => QueingDisplay(
                client: removeItem,
                animation: animation,
              ),
          duration: const Duration(microseconds: 300));
      update();
      //Client suivant a appelle ticket
      callNextTicket(nextId);
    }
  }

//Appeller le suivant ou rappeller
  void callNextTicket(int nextId) {
    if (client.isNotEmpty && isPresent(nextId)) {
      final nextTicket = client.where((el) => el.id == nextId).toList().first;
      final text =
          "le Ticket ${nextTicket.numClient} est attendu a la ${nextTicket.caisse.libelle}";
      speak(text);
    }
  }

  //Firebase messaging to listen event
  Future<void> _receiveMessageFirebase() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      if (remoteMessage.notification == null) return;
      final data = remoteMessage.data;

      log(data.toString());

      switch (data["event"].toString()) {
        case "NOUVEAU TICKET":
          fetchNewTicket();
          break;
        case "NEXT TICKET":
          final id = int.parse(data['id']);
          final nextId = int.parse(data['nextId']);
          deleteTiclet(id, nextId);
          break;
        case "RAPPEL TICKET":
          final id = int.parse(data['id']);
          callNextTicket(id);
          break;
        default:
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    _receiveMessageFirebase();
    log("On init ...");
    getAllDirections();
  }
}
