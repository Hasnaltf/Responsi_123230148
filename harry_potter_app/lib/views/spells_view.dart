import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/spell_controller.dart';
import '../controllers/favorite_controller.dart';

import 'favorite_view.dart';
import 'books_view.dart';

import '../controllers/auth_controller.dart';

class SpellsView extends StatelessWidget {

  SpellsView({super.key});

  final controller =
      Get.find<SpellController>();

  final favorite =
      Get.find<FavoriteController>();
  
  final auth =
    Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Color(0xFFF7F2F7),

      appBar: AppBar(

        backgroundColor: Color(0xFFF7F2F7),

        elevation: 0,

        title: Text(
          "Harry Potter Spells Gallery",
          style: TextStyle(
            color: Colors.black,
          ),
        ),

        actions: [

          IconButton(

            onPressed: () {

              auth.logout();
            },

            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: Obx(

        () => Padding(

          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),

          child: ListView.builder(

            itemCount:
                controller.spells.length,

            itemBuilder: (context, index) {

              final item =
                  controller.spells[index];

              return Card(

                elevation: 2,

                color: Colors.white,

                margin: EdgeInsets.symmetric(
                  vertical: 6,
                ),

                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),

                child: ListTile(

                  contentPadding:
                      EdgeInsets.all(10),

                  leading: Icon(
                    Icons.menu_book,
                    color: Colors.black54,
                  ),

                  title: Text(

                    item['spell'] ?? "-",

                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  subtitle: Text(
                    item['use'] ?? "-",
                  ),

                  trailing: GetBuilder<FavoriteController>(

                    builder: (_) {

                      return IconButton(

                        onPressed: () {

                          favorite.toggleFavorite(item);
                        },

                        icon: Icon(

                          Icons.favorite,

                          color: favorite.isFavorite(item)
                              ? Colors.red
                              : Colors.black54,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),

      floatingActionButton:
          FloatingActionButton(

        backgroundColor:
            Color(0xFFE8D8FF),

        onPressed: () {

          Get.to(() => FavoriteView());
        },

        child: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      ),

      bottomNavigationBar: Padding(

        padding: EdgeInsets.all(15),

        child: SizedBox(

          height: 55,

          child: ElevatedButton(

            style: ElevatedButton.styleFrom(

              backgroundColor: const Color.fromARGB(255, 199, 162, 222),

              elevation: 2,

              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(30),
              ),
            ),

            onPressed: () {

              Get.off(() => BooksView());
            },

            child: Text(

              "Books",

              style: TextStyle(
                color: const Color.fromARGB(255, 216, 213, 221),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}