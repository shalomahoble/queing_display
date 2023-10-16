import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:queing_display/config/app_style.dart';
import 'package:queing_display/config/size_config.dart';

class QHeader extends StatelessWidget {
  const QHeader({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Expanded(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CachedNetworkImage(
              imageUrl: image ??
                  "https://images.pexels.com/photos/10464867/pexels-photo-10464867.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  LoadingAnimationWidget.threeArchedCircle(
                color: KOrange,
                size: 40,
              ),
              errorWidget: (context, url, error) =>
                  Image.asset("assets/images/error.png"),
              width: SizeConfig.blockVertical! * 50,
              height: SizeConfig.blockVertical! * 50,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            "Liste des Tickets Appelés ",
            style: titleWelcome.copyWith(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
