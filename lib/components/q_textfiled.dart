import 'package:flutter/material.dart';
import 'package:queing_display/config/app_style.dart';

class QTextField extends StatelessWidget {
  const QTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text("Code Borne", style: labelStyle),
          ),
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: "Code Borne",
              hintStyle: hintStyle,
              filled: true,
              fillColor: Colors.white,
              focusColor: KOrange,
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: KOrange),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Ce champ est obligatoire ";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
