import 'dart:convert';

import 'package:app/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LogInSignUpController extends GetxController {
  RxBool loader = false.obs;
  RxBool obscureText = true.obs;
  List errorList = [];
  void createUser(
      {required String name,
      required String email,
      required String password}) async {
    var url = "https://api.escuelajs.co/api/v1/users/";

    try {
      var response = await http.post(Uri.parse(url), body: {
        "name": name,
        "email": email,
        "password": password,
        "avatar": "https://imgur.com/GwylUgV",
      });

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 201) {
        Get.back();
        Get.snackbar("Success", "Account Created",
            backgroundColor: Colors.green);
      } else {
        errorList = jsonDecode(response.body)['message'];
        Get.defaultDialog(
            confirmTextColor: Colors.white,
            textConfirm: "ok",
            onConfirm: () => Get.back(),
            title: "Errors",
            titleStyle: const TextStyle(color: Colors.red),
            buttonColor: const Color(0xff9a63d7),
            content: Column(
              children: [
                for (var i = 0; i < errorList.length; i++)
                  Text(
                    errorList[i] +
                        (errorList[i] == 'email must be an email'
                            ? "\nexample@gmail.com"
                            : ""),
                    textAlign: TextAlign.center,
                  ).paddingAll(5)
              ],
            ));
      }
      loader.value = false;
    } catch (e) {
      Get.snackbar("Error", "Something went wrong,\nCheck internet connection",
          backgroundColor: Colors.red);
      loader.value = false;
    }
  }

  loginUser({required String email, required String password}) async {
    var url = "https://api.escuelajs.co/api/v1/auth/login";

    try {
      var response = await http
          .post(Uri.parse(url), body: {"email": email, "password": password});

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        getUserData(
            accessToken: jsonDecode(response.body)['access_token'],
            refreshToken: jsonDecode(response.body)['refresh_token']);
        Get.to(const HomeScreen());
      } else {
        Get.defaultDialog(
            confirmTextColor: Colors.white,
            textConfirm: "ok",
            onConfirm: () => Get.back(),
            title: "Error",
            titleStyle: const TextStyle(color: Colors.red),
            buttonColor: const Color(0xff9a63d7),
            middleText: "Unauthorized User");
      }

      loader.value = false;
    } catch (e) {
      Get.snackbar("Error", "Something went wrong,\nCheck internet connection",
          backgroundColor: Colors.red);
      loader.value = false;
    }
  }

  getUserData(
      {required String accessToken, required String refreshToken}) async {
    print(accessToken);

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      var url = "https://api.escuelajs.co/api/v1/auth/profile";

      var response = await http.get(Uri.parse(url),
          headers: {"Authorization": "Bearer $accessToken"});

      print(response.statusCode);
      print(response.body);
      var data = jsonDecode(response.body);

      sharedPreferences.setInt("id", data['id']);
      sharedPreferences.setString("email", data['email']);
      sharedPreferences.setString("name", data['name']);
      sharedPreferences.setString("role", data['role']);
      sharedPreferences.setString("accessToken", accessToken);

      print(sharedPreferences.get("id"));
      print(sharedPreferences.get("email"));
      print(sharedPreferences.get("id"));
      print(sharedPreferences.get("id"));
      print("End...........");
    } catch (e) {
      print(e);
    }
  }
}
