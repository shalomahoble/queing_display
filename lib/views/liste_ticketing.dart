// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:queing_display/components/flash_info.dart';
import 'package:queing_display/components/q_header.dart';
import 'package:queing_display/components/q_liste_card_ticket.dart';
import 'package:queing_display/components/q_medias.dart';
import 'package:queing_display/config/app_style.dart';
import 'package:queing_display/config/size_config.dart';
import 'package:queing_display/controllers/login_controller.dart';
import 'package:queing_display/controllers/quein_controller.dart';

class ListeTicketing extends StatefulWidget {
  const ListeTicketing({super.key});

  @override
  State<ListeTicketing> createState() => _ListeTicketingState();
}

class _ListeTicketingState extends State<ListeTicketing> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final queinController = Get.find<QueinController>();
    final loginController = Get.find<LoginController>();

    queinController.getAllTicket();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            QHeader(image: loginController.site.value.image),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                QListeCardTicket(), //Li2sting of ticketing widget
                const QMedias(), //Media widget for vidoe or image
              ],
            ),
            // const Spacer(),
            Obx(
              () => FlashInfo(
                text: loginController.getAlerteToText(),
              ),
            ), // flash info widget
          ],
        ),
      ),
    );
  }
}

class TicketingTable extends StatelessWidget {
  const TicketingTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        width: 2.0,
      ),
      columnWidths: const {
        0: FractionColumnWidth(0.5),
        1: FractionColumnWidth(0.5),
      },
      children: [
        /* BuildRowTable(["Numero", "Ticket"]), */
        TableRow(
            decoration: const BoxDecoration(color: Colors.green),
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "Numero",
                    style: titleWelcome.copyWith(fontSize: 25),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "Ticket",
                    style: titleWelcome.copyWith(fontSize: 25),
                  ),
                ),
              ),
            ]),
        ...List.generate(
          4,
          (index) => TableRow(
            decoration: const BoxDecoration(color: Colors.green),
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(index.toString()),
                ),
              ),
              const TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('Caisse 2'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
