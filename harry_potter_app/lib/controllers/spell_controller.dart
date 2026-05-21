import 'package:get/get.dart';

import '../services/api_service.dart';

class SpellController extends GetxController {
  var spells = [].obs;

  @override
  void onInit() {
    fetchSpells();
    super.onInit();
  }

  void fetchSpells() async {
    final data = await ApiService.getSpells();

    spells.value = data;
  }
}