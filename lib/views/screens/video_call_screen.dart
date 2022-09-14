import 'package:flutter/material.dart';
import 'package:gapshap/controllers/auth_controller.dart';
import 'package:gapshap/controllers/jitsi_meet_controller.dart';
import 'package:gapshap/controllers/snack_bar.dart';
import 'package:gapshap/utils/colors.dart';
import 'package:gapshap/views/screens/widgets/custom_button.dart';
import 'package:lottie/lottie.dart';

class VideoCallScreen extends StatefulWidget {
  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController meetingIdController;

  late TextEditingController nameController;

  final AuthController _authController = AuthController();
  final JitsiMeetController _jitsiMeetController = JitsiMeetController();

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(
      text: _authController.user!.displayName,
    );
    super.initState();
  }

  void _joinMeeting() {
    if (meetingIdController.text.isNotEmpty) {
      _jitsiMeetController.createMeeting(
          roomName: "bySLIA" + meetingIdController.text + "GAPSHAP",
          username: nameController.text,
          isAudioMuted: true,
          isVideoMuted: true);
    } else {
      snackBar("Meeting ID cannot be empty.", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "You are in Meeting Lobby",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Text(
              "Hey,",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              _authController.user!.displayName!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 38,
              ),
            ),
            Lottie.asset(
              "assets/animations/join_meeting_animation.json",
              height: 350,
              width: 350,
              animate: true,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "Enter Room ID",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: meetingIdController,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    decoration: InputDecoration(
                      fillColor: secondaryBackgroundColor,
                      filled: true,
                      border: InputBorder.none,
                      hintText: "Enter 7 digit ROOM ID here.",
                      contentPadding: EdgeInsets.all(10),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Your Username",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: nameController,
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    decoration: InputDecoration(
                      fillColor: secondaryBackgroundColor,
                      filled: true,
                      border: InputBorder.none,
                      hintText: "Enter USER NAME here.",
                      contentPadding: EdgeInsets.all(10),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            CustomButton(text: "Tap to Join", onPressed: _joinMeeting)
          ],
        ),
      ),
    );
  }
}
