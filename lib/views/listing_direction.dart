import 'package:flutter/material.dart';
import 'package:queing_display/components/q_card_image.dart';
import 'package:queing_display/components/q_search_filed.dart';
import 'package:queing_display/config/app_style.dart';
import 'package:queing_display/config/size_config.dart';

class ListingDirection extends StatelessWidget {
  const ListingDirection({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/tinitz-logo.png'),
            Text('Liste des Directions', style: flashInfoTextStyle),
            const QSearchField(hintText: "Rechercher une direction"),
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (context, index) => QCardImage(
                  directionLabel: "SOCOCOE",
                  imagePath:
                      "https://images.pexels.com/photos/2537379/pexels-photo-2537379.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  onPress: () {},
                ),
              ),
            )),
          ],
        ),
      ),
    ));
  }
}