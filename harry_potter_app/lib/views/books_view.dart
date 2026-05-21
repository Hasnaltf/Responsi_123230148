import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/books_controller.dart';

import 'books_detail_view.dart';
import 'spells_view.dart';
import 'profile_view.dart';

class BooksView extends StatelessWidget {
  BooksView({super.key});

  final controller = Get.find<BooksController>();
  final auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F2F7),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F2F7),
        elevation: 0,

        title: const Text(
          "Harry Potter Books Collection",
          style: TextStyle(
            color: Colors.black,
            // fontWeight: FontWeight.bold,
          ),
        ),

        actions: [

          IconButton(

            onPressed: () {

              Get.to(() => ProfileView());
            },

            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),

          IconButton(

            onPressed: () {
              auth.logout();
            },

            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: Obx(() {

        if (controller.isLoading.value) {

          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.books.isEmpty) {

          return const Center(
            child: Text("No Books Found"),
          );
        }

        return ListView.builder(

          padding: const EdgeInsets.all(10),

          itemCount: controller.books.length,

          itemBuilder: (context, index) {

            final item =
                controller.books[index];

            return Card(

              elevation: 2,

              color: Colors.white,

              margin:
                  const EdgeInsets.only(bottom: 12),

              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15),
              ),

              child: ListTile(

                contentPadding:
                    const EdgeInsets.all(10),

                leading: ClipRRect(

                  borderRadius:
                      BorderRadius.circular(8),

                  child: Image.network(

                    item['cover'] ?? "",

                    width: 50,
                    height: 70,

                    fit: BoxFit.cover,
                  ),
                ),

                title: Text(
                  item['title'] ?? "-",
                ),

                subtitle: Text(
                  "Release date: ${item['releaseDate']}",
                ),

                onTap: () {

                  Get.to(
                    () => BooksDetailView(
                      data: item,
                    ),
                  );
                },
              ),
            );
          },
        );
      }),

      bottomNavigationBar: Padding(

        padding: const EdgeInsets.all(15),

        child: SizedBox(

          height: 55,

          child: ElevatedButton(

            style: ElevatedButton.styleFrom(

              backgroundColor: const Color.fromARGB(255, 199, 162, 222),

              elevation: 2,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),

            onPressed: () {

              Get.to(() => SpellsView());
            },

            child: const Text(

              "Spells",

              style: TextStyle(
                color: Color.fromARGB(255, 216, 213, 221),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}