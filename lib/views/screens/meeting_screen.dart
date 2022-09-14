import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gapshap/controllers/jitsi_meet_controller.dart';
import 'package:gapshap/views/screens/video_call_screen.dart';
import 'package:gapshap/views/screens/widgets/reusable_icon.dart';

class MeetingScreen extends StatefulWidget {
  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  // const MeetingScreen({Key? key}) : super(key: key);
  final JitsiMeetController _jitsiMeetController = JitsiMeetController();

  createNewMeeting() {
    var random = Random();
    String roomName =
        "bySLIA" + (random.nextInt(10000000) + 10000000).toString() + "GAPSHAP";
    _jitsiMeetController.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => VideoCallScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ReusableIcon(
                text: "New Meeting",
                onPressed: createNewMeeting,
                lottieAnimation: "assets/animations/new_meeting_animation.json",
              ),
              ReusableIcon(
                text: "Join Meeting",
                onPressed: joinMeeting,
                lottieAnimation:
                    "assets/animations/join_now_meeting_animation.json",
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ReusableIcon(
                text: "Schedule",
                onPressed: () {},
                lottieAnimation:
                    "assets/animations/schedule_meeting_animation.json",
              ),
              ReusableIcon(
                text: "Share Screen",
                onPressed: () {},
                lottieAnimation:
                    "assets/animations/share_screen_animation.json",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
