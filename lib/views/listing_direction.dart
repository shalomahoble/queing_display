import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:queing_display/components/q_card_image.dart';
import 'package:queing_display/components/q_search_filed.dart';
import 'package:queing_display/config/app_routes.dart';
import 'package:queing_display/config/app_style.dart';
import 'package:queing_display/config/size_config.dart';
import 'package:queing_display/controllers/quein_controller.dart';

class ListingDirection extends StatelessWidget {
  const ListingDirection({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    //Get all direactions

    final queinController = Get.put(QueinController());

    /*   final listenController = Get.put(ListenController()); */

    return Obx(() {
      if (queinController.loading.value) {
        return Scaffold(
            body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/tinitz-logo.png'),
                Text('Liste des Directions', style: flashInfoTextStyle),
                QSearchField(
                  controller: queinController.searchDirectionController.value,
                  hintText: "Rechercher une direction",
                  onChange: (query) => queinController.searchDirection(query),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: queinController.filteredDirections.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        mainAxisExtent: SizeConfig.screenWidth! * 0.3,
                      ),
                      itemBuilder: (context, index) {
                        final direction =
                            queinController.filteredDirections[index];
                        return GestureDetector(
                          onTap: () {
                            queinController
                                .getAllSiteForDirection(direction.id);
                            Get.toNamed(AppRoutes.LISTESITES);
                          },
                          child: QCardImage(
                            directionLabel: direction.libelle,
                            imagePath: direction.image,
                          ),
                        );
                      }),
                )),
              ],
            ),
          ),
        ));
      } else {
        return Scaffold(
          body: Center(
            child: LoadingAnimationWidget.threeArchedCircle(
              color: KOrange,
              size: 40,
            ),
          ),
        );
      }
    });
  }
}
