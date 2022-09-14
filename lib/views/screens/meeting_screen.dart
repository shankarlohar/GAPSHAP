import 'package:flutter/material.dart';
import 'package:gapshap/views/screens/widgets/reusable_icon.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ReusableIcon(
                icon: Icons.videocam,
                text: "New Meeting",
                onPressed: () {},
              ),
              ReusableIcon(
                icon: Icons.add_box_rounded,
                text: "Join Meeting",
                onPressed: () {},
              ),
              ReusableIcon(
                icon: Icons.calendar_today,
                text: "Schedule",
                onPressed: () {},
              ),
              ReusableIcon(
                icon: Icons.arrow_upward,
                text: "Share Screen",
                onPressed: () {},
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(
                'Create/Join Meetings',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
