import 'package:flutter/material.dart';
import 'package:gapshap/utils/colors.dart';
import 'package:lottie/lottie.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              minimumSize: Size(
                double.infinity,
                50,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  30,
                ),
              ),
            ),
            onPressed: onPressed,
            icon: Lottie.asset(
              "assets/animations/google_logo_animation.json",
              height: 25,
              width: 25,
              animate: true,
            ),
            label: Text(
              text,
              style: TextStyle(
                color: buttonColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Lottie.asset(
            "assets/animations/mwl_animation.json",
            height: 100,
            width: double.infinity,
            animate: true,
          ),
          Text(
            "By",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Shankar Lohar",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }
}
