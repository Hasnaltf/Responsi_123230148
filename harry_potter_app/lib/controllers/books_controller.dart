import 'package:get/get.dart';

import '../services/api_service.dart';

class BooksController extends GetxController {

  var books = <dynamic>[].obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    fetchBooks();
    super.onInit();
  }

  void fetchBooks() async {

    try {

      isLoading.value = true;

      final data =
          await ApiService.getBooks();

      books.assignAll(data);

      print(data);

    } catch (e) {

      print("ERROR BOOKS : $e");

    } finally {

      isLoading.value = false;
    }
  }
}