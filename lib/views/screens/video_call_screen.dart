import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gapshap/controllers/auth_controller.dart';
import 'package:gapshap/controllers/jitsi_meet_controller.dart';
import 'package:gapshap/controllers/snack_bar.dart';
import 'package:gapshap/utils/colors.dart';
import 'package:gapshap/views/screens/widgets/custom_button.dart';
import 'package:gapshap/views/screens/widgets/meeting_option.dart';
import 'package:lottie/lottie.dart';

class VideoCallScreen extends StatefulWidget {
  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController meetingIdController;

  late TextEditingController nameController;

  bool isAudioMuted = true;
  bool isVideoHidden = true;
  late bool exist;

  final AuthController _authController = AuthController();
  final JitsiMeetController _jitsiMeetController = JitsiMeetController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(
      text: _authController.user!.displayName,
    );
    super.initState();
  }

  Future<bool> checkExist(String docID) async {
    try {
      await _firestore.collection("meetings").doc(docID).get().then((doc) {
        exist = doc.exists;
      });
      return exist;
    } catch (e) {
      // If any error
      return false;
    }
  }

  Future<void> _joinMeeting() async {
    if (meetingIdController.text.isNotEmpty) {
      String meeting = "bySLIA" + meetingIdController.text + "GAPSHAP";
      if (await checkExist(meeting)) {
        _jitsiMeetController.createMeeting(
            roomName: meeting,
            username: nameController.text,
            isAudioMuted: isAudioMuted,
            isVideoMuted: isVideoHidden);
      } else {
        snackBar(
          "assets/animations/wrong_input_animation.json",
          "Invalid meeting ID!",
          context,
        );
      }
    } else {
      snackBar(
        "assets/animations/cannot_be_empty_animation.json",
        "Meeting ID cannot be empty!",
        context,
      );
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
              height: 5,
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
              height: 325,
              width: 325,
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
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    decoration: InputDecoration(
                      fillColor: secondaryBackgroundColor,
                      filled: true,
                      border: InputBorder.none,
                      hintText: "Enter 8 digit ROOM ID here.",
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
                    keyboardType: TextInputType.text,
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
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MeetingOption(
                        text: "Mute Audio",
                        isMute: isAudioMuted,
                        onChange: onAudio,
                      ),
                      MeetingOption(
                        text: "Turn off Video",
                        isMute: isVideoHidden,
                        onChange: onVideo,
                      ),
                    ],
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

  onAudio(bool value) {
    setState(() {
      isAudioMuted = value;
    });
  }

  onVideo(bool value) {
    setState(() {
      isVideoHidden = value;
    });
  }
}
