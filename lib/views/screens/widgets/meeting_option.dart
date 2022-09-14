import 'package:flutter/material.dart';
import 'package:gapshap/utils/colors.dart';

class MeetingOption extends StatelessWidget {
  const MeetingOption(
      {Key? key,
      required this.text,
      required this.isMute,
      required this.onChange})
      : super(key: key);
  final String text;
  final bool isMute;

  final Function(bool) onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Switch(value: isMute, onChanged: onChange)
        ],
      ),
    );
  }
}
