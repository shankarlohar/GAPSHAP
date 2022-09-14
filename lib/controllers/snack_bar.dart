import 'package:flutter/material.dart';
import 'package:gapshap/controllers/reusable_snackbar.dart';
import 'package:gapshap/utils/colors.dart';

snackBar(String lottieAnimation, String title, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      duration: Duration(seconds: 2),
      content: SizedBox(
        height: 350,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReusableSnackbar(
                lottieAnimation: lottieAnimation,
                text: title,
                onPressed: () {}),
          ],
        ),
      ),
    ),
  );
}
