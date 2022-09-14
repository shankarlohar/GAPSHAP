import 'package:flutter/material.dart';
import 'package:gapshap/utils/colors.dart';

class ReusableIcon extends StatelessWidget {
  const ReusableIcon(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed})
      : super(key: key);
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(
                  25,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.black.withOpacity(
                      0.7,
                    ),
                  ),
                ],
              ),
              child: Icon(
                icon,
                size: 30,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
