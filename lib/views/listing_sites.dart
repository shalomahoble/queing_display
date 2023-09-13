import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:queing_display/components/q_card_image.dart';
import 'package:queing_display/components/q_search_filed.dart';
import 'package:queing_display/config/app_routes.dart';
import 'package:queing_display/config/app_style.dart';
import 'package:queing_display/config/size_config.dart';
import 'package:queing_display/controllers/quein_controller.dart';

class ListingSite extends StatelessWidget {
  const ListingSite({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    //Get All site for direction specifique
    final queinController = Get.find<QueinController>();

    //Get site id Select
    final box = GetStorage();

    return Obx(() {
      if (queinController.allSites.isNotEmpty) {
        return Scaffold(
            body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/tinitz-logo.png'),
                Text('Liste des sites', style: flashInfoTextStyle),
                QSearchField(
                  controller: queinController.searchSiteController.value,
                  hintText: "Rechercher un site",
                  onChange: (query) => queinController.searchSite(query),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: GridView.builder(
                      itemCount: queinController.filteredSites.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        final site = queinController.filteredSites[index];
                        return GestureDetector(
                          onTap: () {
                            box.write('site', site.id);
                            Get.offAllNamed(AppRoutes.HOMEPAGE);
                          },
                          child: QCardImage(
                            directionLabel: site.libelle,
                            imagePath: site.image,
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
