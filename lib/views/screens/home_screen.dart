import 'package:flutter/material.dart';
import 'package:gapshap/utils/colors.dart';
import 'package:gapshap/views/screens/contact_screen.dart';
import 'package:gapshap/views/screens/history_screen.dart';
import 'package:gapshap/views/screens/meeting_screen.dart';
import 'package:gapshap/views/screens/setting_screen.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  final List<Widget> pages = [
    MeetingScreen(),
    HistoryScreen(),
    ContactScreen(),
    SettingScreen(),
  ];

  final List<String> headlineIcon = [
    "assets/animations/meet_chat_animation.json",
    "assets/animations/meetings_animation.json",
    "assets/animations/contacts_animation.json",
    "assets/animations/settings_animation.json"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "GAPSHAP!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Lottie.asset(
                  headlineIcon[pageIndex],
                  height: 100,
                  width: 100,
                  animate: true,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        currentIndex: pageIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: buttonColor,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank),
            label: "Meet & Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: "Meetings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          )
        ],
      ),
      body: pages[pageIndex],
    );
  }
}
