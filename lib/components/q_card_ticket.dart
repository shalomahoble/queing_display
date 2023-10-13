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
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  client.caisse.libelle,
                  style: laStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://images.pexels.com/photos/10464867/pexels-photo-10464867.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        LoadingAnimationWidget.threeArchedCircle(
                      color: KOrange,
                      size: 40,
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/images/error.png"),
                    width: 50,
                    height: 50,
                  ),
                ),
                /*  ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    "https://images.pexels.com/photos/10464867/pexels-photo-10464867.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ), */
                const SizedBox(width: 25),
                Text(
                  client.numClient,
                  style: laStyle.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            )
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
