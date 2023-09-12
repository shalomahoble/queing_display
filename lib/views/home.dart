import 'package:flutter/material.dart';

import '../components/queing_display.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: const [
          QueingDisplay(),
          QueingDisplay(),
          QueingDisplay(),
          QueingDisplay(),
        ],
      )),
    );
  }
}
