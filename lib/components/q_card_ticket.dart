import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:queing_display/config/app_style.dart';
import 'package:queing_display/models/client.dart';

class QCardTicket extends StatelessWidget {
  QCardTicket({
    super.key,
    required this.client,
    required this.animation,
  });

  final Client client;
  Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10, top: 5),
              alignment: Alignment.topRight,
              child: Text(
                client.caisse.libelle,
                style: laStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CachedNetworkImage(
                      imageUrl: client.caisse.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          LoadingAnimationWidget.threeArchedCircle(
                        color: KOrange,
                        size: 40,
                      ),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/error.png"),
                      width: 40,
                      height: 40,
                    ),
                  ),
                  const SizedBox(width: 60),
                  Text(
                    client.numClient,
                    style: laStyle.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 2, color: Colors.black),
            /*  IconButton(
              onPressed: () {},
              icon: const Icon(Icons.image),
            ) */
          ],
        ),
      ),
    );
  }
}
