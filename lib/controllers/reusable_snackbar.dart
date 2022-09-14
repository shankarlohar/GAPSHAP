import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ReusableSnackbar extends StatelessWidget {
  const ReusableSnackbar(
      {Key? key,
      required this.lottieAnimation,
      required this.text,
      required this.onPressed})
      : super(key: key);
  final String lottieAnimation;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onPressed,
              child: Lottie.asset(
                lottieAnimation,
                height: 150,
                width: 150,
                animate: true,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
