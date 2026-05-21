import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends StatelessWidget {

  FavoriteView({super.key});

  final favorite =
      Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Color(0xFFF7F2F7),

      appBar: AppBar(

        backgroundColor: Color(0xFFF7F2F7),

        elevation: 0,

        title: Text(
          "Favorite Spell",
          style: TextStyle(
            color: Colors.black,
          ),
        ),

        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),

      body: Obx(

        () => Padding(

          padding: EdgeInsets.all(10),

          child: ListView.builder(

            itemCount:
                favorite.favorites.length,

            itemBuilder: (context, index) {

              final item =
                  favorite.favorites[index];

              return Card(

                elevation: 2,

                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),

                child: ListTile(

                  leading: Icon(
                    Icons.menu_book,
                  ),

                  title: Text(
                    item['spell'],
                  ),

                  subtitle: Text(
                    item['use'],
                  ),

                  trailing: IconButton(

                    onPressed: () {

                      favorite.toggleFavorite(item);
                    },

                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}