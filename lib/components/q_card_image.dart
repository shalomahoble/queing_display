// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:queing_display/config/app_style.dart';
import 'package:queing_display/config/size_config.dart';

class QCardImage extends StatelessWidget {
  const QCardImage({
    Key? key,
    required this.directionLabel,
    required this.imagePath,
    required this.onPress,
  }) : super(key: key);

  final String directionLabel;
  final String imagePath;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () => onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: imagePath,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    LoadingAnimationWidget.threeArchedCircle(
                  color: KOrange,
                  size: 40,
                ),
                errorWidget: (context, url, error) =>
                    Image.asset("assets/images/error.png"),
                width: SizeConfig.screenWidth! * 12,
                height: SizeConfig.screenWidth! * .33,
              ),
            ),
            Text(directionLabel.toUpperCase(), style: titleWelcome),
          ],
        ),
      ),
    );
  }
}
