import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:queing_display/config/app_style.dart';
import 'package:queing_display/controllers/quein_controller.dart';

import '../components/queing_display.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    //get all caisses information with client
    final queinController = Get.find<QueinController>();

    queinController.getAllTocket();

    return Obx(() {
      if (queinController.client.isEmpty) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.hourglass_disabled_outlined, size: 50),
                Text("Aucun ticket pour l'instant", style: titleWelcome),
              ],
            ),
          ),
        );
      } else {
        return Scaffold(
          body: SafeArea(
              minimum: const EdgeInsets.symmetric(vertical: 10),
              child: AnimatedList(
                scrollDirection: Axis.vertical,
                key: _listKey,
                initialItemCount: queinController.client.length,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index, animation) {
                  final client = queinController.client[index];
                  return GestureDetector(
                    onTap: () {
                      /*  queinController.deleteTiclet(client.id); */
                      final removeItem = queinController.client.removeAt(index);
                      _listKey.currentState!.removeItem(
                        index,
                        (context, animation) => QueingDisplay(
                          client: removeItem,
                          animation: animation,
                        ),
                        
                      );
                    },
                    child: QueingDisplay(client: client, animation: animation),
                  );
                },
              )),
        );
      }
    });
  }
}
