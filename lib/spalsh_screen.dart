import 'dart:async';

import 'package:app/Screens/home_screen.dart';
import 'package:app/Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 2), (timer) async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      if (sharedPreferences.getInt('id') != null) {
        Get.offAll(HomeScreen());
      } else {
        Get.offAll(LoginScreen());
      }
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome"),
      ),
    );
  }
}
