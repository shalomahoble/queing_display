import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queing_display/components/q_card_ticket.dart';
import 'package:queing_display/config/app_style.dart';
import 'package:queing_display/config/size_config.dart';
import 'package:queing_display/controllers/quein_controller.dart';

class QListeCardTicket extends StatelessWidget {
  QListeCardTicket({
    super.key,
  });

  final queinController = Get.find<QueinController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(() {
      if (queinController.client.isNotEmpty) {
        return Expanded(
          flex: 2,
          child: Container(
            height: SizeConfig.blockHorizontal! * 30,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
            ),
            child: AnimatedList(
              scrollDirection: Axis.vertical,
              key: queinController.listKey,
              initialItemCount: queinController.client.length,
              itemBuilder: (context, index, animation) {
                final client = queinController.client[index];
                return QCardTicket(
                  client: client,
                  animation: animation,
                );
              },
            ),
          ),
        );
      } else {
        return Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.hourglass_disabled_outlined, size: 50),
              Text("Aucun ticket pour l'instant", style: titleWelcome),
            ],
          ),
        );
      }
    });
  }
}