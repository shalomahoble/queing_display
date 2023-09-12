import 'package:flutter/material.dart';
import 'package:queing_display/config/app_style.dart';

class QSearchField extends StatelessWidget {
  const QSearchField({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        filled: true,
        fillColor: Colors.white,
        focusColor: KOrange,
        suffixIcon: const Icon(Icons.search_sharp),
      ),
    );
  }
}
