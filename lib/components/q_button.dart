// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:queing_display/config/app_style.dart';

class QButton extends StatelessWidget {
  const QButton({
    Key? key,
    required this.onPressed,
    required this.isLoaded,
  }) : super(key: key);

  final void Function() onPressed;
  final bool isLoaded;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: OutlinedButton(
          onPressed: onPressed,
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(KOrange),
            minimumSize: MaterialStatePropertyAll(
              Size(double.infinity, 0),
            ),
            padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 15),
            ),
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadiusDirectional.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          child: Text("Valider", style: btnStyle),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child:
            LoadingAnimationWidget.threeArchedCircle(color: KOrange, size: 40),
      ),
    );
  }
}
