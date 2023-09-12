import 'package:flutter/material.dart';
import 'package:queing_display/config/app_style.dart';

class QueingDisplay extends StatelessWidget {
  const QueingDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.orangeAccent.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("00001", style: flashInfoTextStyle),
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
                    "Caisse 02",
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
    );
  }
}
