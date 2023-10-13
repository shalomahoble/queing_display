// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:queing_display/config/app_style.dart';

class QTextFieldPassword extends StatefulWidget {
  const QTextFieldPassword({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<QTextFieldPassword> createState() => _QTextFieldPasswordState();
}

bool _obscureText = true;

class _QTextFieldPasswordState extends State<QTextFieldPassword> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text("Mot de Passe", style: labelStyle),
          ),
          TextFormField(
            controller: widget.controller,
            keyboardType: TextInputType.text,
            obscureText: _obscureText,
            obscuringCharacter: '*',
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            decoration: InputDecoration(
                hintText: "mot de passe",
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
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    _obscureText = !_obscureText;
                  }),
                  icon: Icon(
                    _obscureText ? Icons.remove_red_eye : Icons.visibility_off,
                  ),
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Mot de passe obligatoire";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
