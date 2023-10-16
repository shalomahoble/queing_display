// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import 'package:queing_display/config/app_style.dart';
import 'package:queing_display/config/size_config.dart';

class FlashInfo extends StatelessWidget {
  const FlashInfo({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (text.isEmpty) {
      return const SizedBox.shrink();
    }
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: SizeConfig.blockHorizontal! * 45,
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
                style: flashInfoTitleStyle.copyWith(
                  fontSize: 20,
                  letterSpacing: 1,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Marquee(
                  text: text,
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
