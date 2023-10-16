import 'package:flutter/material.dart';
import 'package:queing_display/config/size_config.dart';

class QMedias extends StatelessWidget {
  const QMedias({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        width: 40,
        height: SizeConfig.blockHorizontal! * 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: AssetImage("assets/images/orange.png"),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
