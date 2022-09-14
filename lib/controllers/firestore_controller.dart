import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void addMeetingToFirestore(String meetingName) async {
    try {
      await _firestore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .collection("meetings")
          .add({
        "meetingName": meetingName,
        "createdAt": DateTime.now(),
      });
    } catch (e) {
      print("Firestore Error: $e");
    }
  }

  void addMeetingCheck(String meetingName) async {
    try {
      await _firestore.collection("meetings").doc(meetingName).set({
        "meetingActive": true,
      });
    } catch (e) {
      print("Firestore Error: $e");
    }
  }

  void removeMeetingCheck(String meetingName) async {
    try {
      await _firestore.collection("meetings").doc(meetingName).delete();
    } catch (e) {
      print("Firestore Error: $e");
    }
  }
}
