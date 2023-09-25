

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queing_display/config/app_style.dart';
import 'package:queing_display/controllers/quein_controller.dart';

import '../components/queing_display.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //get all caisses information with client
    final queinController = Get.find<QueinController>();

    queinController.getAllTicket();

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
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedNetworkImage(
                  imageUrl: queinController.site.value.image,
                  width: 50,
                  errorWidget: (context, url, error) =>
                      const Text("assets/images/error.png"),
                  placeholder: (context, url) => const Icon(Icons.image),
                ),
                Text("Liste des tickets en cours", style: titleWelcome),
              ],
            ),
            centerTitle: true,
            elevation: 5,
            shadowColor: Colors.black12,
          ),
          body: SafeArea(
            minimum: const EdgeInsets.symmetric(vertical: 10),
            child: Obx(
              () => AnimatedList(
                scrollDirection: Axis.vertical,
                key: queinController.listKey,
                initialItemCount: queinController.client.length,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index, animation) {
                  final client = queinController.client[index];
                  return GestureDetector(
                    onTap: () {},
                    child: QueingDisplay(
                      client: client,
                      animation: animation,
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }
    });
  }
}
