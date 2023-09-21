// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:queing_display/config/app_style.dart';
import 'package:queing_display/models/client.dart';

// ignore: must_be_immutable
class QueingDisplay extends StatelessWidget {
  QueingDisplay({
    Key? key,
    required this.client,
    required this.animation,
  }) : super(key: key);

  final Client client;
  Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListTile(
                leading: const Icon(Icons.contact_page, size: 35),
                title: Text(client.numClient,
                    style: laStyle.copyWith(fontSize: 15)),
                trailing: Text(
                  client.caisse.libelle,
                  style: laStyle.copyWith(fontSize: 15),
                ),
                subtitle: Text(client.createdAtDate()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
