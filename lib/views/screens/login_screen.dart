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

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        Navigator.pop(context);
      }
    });
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

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
                  controller: _controller,
                  onLoaded: (composition) {
                    _controller.duration = composition.duration;
                    _controller.forward().whenComplete(() =>
                        Navigator.pushNamedAndRemoveUntil(
                            context, HomeScreen.routeName, (route) => false));
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
          ),
        );
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
                snackBar(
                  "assets/animations/login_failed_animation.json",
                  "Login Failed!",
                  context,
                );
              } else {
                snackBar(
                  "assets/animations/something_went_wrong_animation.json",
                  res,
                  context,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
