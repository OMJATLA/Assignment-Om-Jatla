import 'package:app/Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.clear();
              Get.offAll(const LoginScreen());
            },
            child: const Icon(Icons.logout)),
      ),
      body: const Center(
        child: Text("hello"),
      ),
    );
  }
}
