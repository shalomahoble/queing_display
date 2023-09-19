import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:queing_display/controllers/quein_controller.dart';

class ListenController extends GetxController {
  QueinController? _queinController;
  FlutterTts flutterTts = FlutterTts();

  //Get information to queincontroller to update it
  QueinController get queinController {
    _queinController ??= Get.find<QueinController>();
    return _queinController!;
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

  @override
  void onInit() {
    super.onInit();

    speak(
        " Avec ces étapes, vous pouvez intégrer la synthèse vocale dans votre application Flutter pour permettre à votre application de lire du texte à haute voix. N'oubliez pas d'adapter les paramètres de langue, de hauteur de voix et de vitesse de parole selon vos besoins spécifiques.");
  }
}
