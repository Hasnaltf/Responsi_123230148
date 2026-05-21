import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../services/notification_service.dart';

class FavoriteController extends GetxController {

  final box = Hive.box('favorites');

  var favorites = [].obs;

  @override
  void onInit() {
    loadFavorites();
    super.onInit();
  }

  void loadFavorites() {

    favorites.value =
        box.values.toList();
  }

  bool isFavorite(dynamic spell) {

    return box.values.any(
      (e) => e['spell'] == spell['spell'],
    );
  }

  Future<void> toggleFavorite(dynamic spell) async {

    final exist = isFavorite(spell);

    if (exist) {

      final key = box.keys.firstWhere(
        (k) =>
            box.get(k)['spell']
            == spell['spell'],
      );

      box.delete(key);
      await NotificationService.showNotification(

        title: "Delete notification",

        body:
            "You deleted ${spell['spell']} from your fav list!",
      );

    } else {

      box.add(spell);

      Get.snackbar(

        "Add!",
        "${spell['spell']} successfully added to fav list!",

        backgroundColor: Colors.green,
        colorText: Colors.white,

        snackPosition: SnackPosition.TOP,

        margin: EdgeInsets.all(10),
      );
    }

    loadFavorites();
    update();
  }
}