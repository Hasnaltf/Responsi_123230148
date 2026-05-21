import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance
        .addPostFrameCallback((_) {

      checkSession();
    });
  }

  void checkSession() async {

    await Get.find<AuthController>()
        .checkLogin();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: CircularProgressIndicator(),
      ),
    );
  }
}