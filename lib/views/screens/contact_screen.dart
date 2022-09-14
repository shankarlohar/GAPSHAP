import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/animations/under_construction_animation.json",
          animate: true,
        ),
      ),
    );
  }
}
