import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:queing_display/config/app_style.dart';
import 'package:queing_display/config/size_config.dart';

class FlashInfo extends StatelessWidget {
  const FlashInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: SizeConfig.blockHorizontal! * 80,
        color: Colors.white,
        child: Row(
          children: [
            Container(
              height: double.infinity,
              width: SizeConfig.blockHorizontal! * 15,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                'Flash Infos',
                style: flashInfoTitleStyle,
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Marquee(
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pretium massa mollis lorem blandit imperdiet. Nulla mattis vitae mauris vel condimentum. Nam posuere, augue vitae lobortis consequat, odio ante condimentum est, at maximus augue purus id metus. Curabitur condimentum aliquet ante at aliquet. Quisque vel massa congue, bibendum leo sodales, malesuada ante. Maecenas sed tortor quis ipsum dictum sollicitudin.',
                  style: flashInfoTextStyle.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
