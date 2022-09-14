import 'package:flutter/material.dart';
import 'package:gapshap/controllers/auth_controller.dart';
import 'package:gapshap/controllers/snack_bar.dart';
import 'package:gapshap/views/screens/home_screen.dart';
import 'package:gapshap/views/screens/widgets/google_button.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final AuthController _authController = AuthController();

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
    );
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        controller.reset();
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void showDoneDialog() => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    "assets/animations/done_animation.json",
                    repeat: false,
                    controller: controller,
                    onLoaded: (composition) {
                      controller.duration = composition.duration;
                      controller.forward();
                    },
                  ),
                  Text(
                    "Logged in Successfully!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "GAPSHAP!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "By SLIA",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Start or join a meeting",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
            ),
            child: Lottie.asset(
              "assets/animations/login_screen_animation.json",
              animate: true,
            ),
          ),
          GoogleButton(
            text: "Login with Google",
            onPressed: () async {
              String res = await _authController.signInWithGoogle();
              if (res == "success") {
                showDoneDialog();
              } else if (res == 'failed') {
                snackBar("Login Failed!", context);
              } else {
                snackBar(res, context);
              }
            },
          ),
        ],
      ),
    );
  }
}
