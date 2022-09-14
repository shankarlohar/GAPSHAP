import 'package:gapshap/controllers/auth_controller.dart';
import 'package:gapshap/controllers/firestore_controller.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class JitsiMeetController {
  final FirestoreController _controller = FirestoreController();
  final AuthController _authController = AuthController();
  createMeeting(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideoMuted,
      String username = ''}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      String name;
      if (username.isEmpty) {
        name = _authController.user!.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetingOptions(room: roomName)
        // ..subject = "Meeting with Gunschu"
        ..userDisplayName = name
        ..userEmail = _authController.user!.email
        ..userAvatarURL = _authController.user!.photoURL // or .png
        // ..audioOnly = true
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      _controller.addMeetingToFirestore(roomName);
      _controller.addMeetingCheck(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("JitsiMeet Error: $error");
    }
  }
}
