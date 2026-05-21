import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class ProfileView extends StatelessWidget {

  ProfileView({super.key});

  final auth =
      Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFF7F2F7),

      appBar: AppBar(

        backgroundColor: const Color(0xFFF7F2F7),

        elevation: 0,

        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            const SizedBox(height: 40),

            Center(

              child: CircleAvatar(

                radius: 70,

                backgroundColor:
                    const Color.fromARGB(255, 212, 159, 205),

                child: const Text(

                  "HL",

                  style: TextStyle(

                    fontSize: 50,

                    color: Color.fromARGB(255, 66, 26, 134),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(

              "Hasna Lathifah NR",

              style: TextStyle(

                fontSize: 28,

                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(

              "Praktikum TPM sangat sangat menyenangkan, membuat saya bahagia setiap mengerjakan tugas-tugasnya. Nilai A nya dong  mas xixixi ",

              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const Spacer(),

            SizedBox(

              width: double.infinity,

              height: 55,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(

                  backgroundColor: Colors.white,

                  elevation: 2,

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30),
                  ),
                ),

                onPressed: () {

                  auth.logout();
                },

                child: const Text(

                  "Logout",

                  style: TextStyle(

                    color: Colors.deepPurple,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}