import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/books_view.dart';
import '../views/login_view.dart';

class AuthController extends GetxController {

  var username = "".obs;

  @override
  void onInit() {
    getUsername();
    super.onInit();
  }

  Future<void> getUsername() async {

    final prefs =
        await SharedPreferences.getInstance();

    username.value =
        prefs.getString("username") ?? "User";
  }

  Future<void> checkLogin() async {

    final prefs =
        await SharedPreferences.getInstance();

    final isLogin =
        prefs.getBool("login") ?? false;

    print("STATUS LOGIN : $isLogin");

    await Future.delayed(
      const Duration(seconds: 1),
    );

    if (isLogin) {

      await getUsername();

      Get.offAll(
        () => BooksView(),
      );

    } else {

      Get.offAll(
        () => LoginView(),
      );
    }
  }

  Future<void> login(
    String usernameInput,
    String password,
  ) async {

    if (password == "123230148") {

      final prefs =
          await SharedPreferences.getInstance();

      await prefs.setBool(
        "login",
        true,
      );

      await prefs.setString(
        "username",
        usernameInput,
      );

      username.value = usernameInput;

      Get.snackbar(

        "Success!",
        "Logged in Successfully",

        snackPosition:
            SnackPosition.TOP,

        backgroundColor:
            Colors.green,

        colorText:
            Colors.white,

        margin:
            const EdgeInsets.all(10),
      );

      Get.offAll(
        () => BooksView(),
      );

    } else {

      Get.snackbar(

        "Error",
        "Password salah",

        backgroundColor:
            Colors.red,

        colorText:
            Colors.white,
      );
    }
  }

  Future<void> logout() async {

    final prefs =
        await SharedPreferences.getInstance();

    await prefs.clear();

    username.value = "";

    Get.offAll(
      () => LoginView(),
    );

    Get.snackbar(

      "Success!",
      "Logout Successfully",

      backgroundColor:
          Colors.green,

      colorText:
          Colors.white,
    );
  }
}