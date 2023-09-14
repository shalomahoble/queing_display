// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:queing_display/config/app_style.dart';
import 'package:queing_display/models/client.dart';

class QueingDisplay extends StatelessWidget {
  const QueingDisplay({
    Key? key,
    required this.client,
    required this.animation,
  }) : super(key: key);

  final Client client;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(client.numClient.toString(),
                        style: flashInfoTextStyle),
                    Expanded(
                        child: Container(
                      width: 10,
                      height: 2,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                    )),
                    Text(
                      client.caisse.libelle,
                      style: flashInfoTextStyle.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.black, thickness: 2),
              ],
            )
          ],
        ),
      ),
    );
  }
}
