import 'package:get/get.dart';
import 'package:qurannow/models/KotaModel.dart';

class LocationController extends GetxController {
  var isLoading = false.obs;

  RxList listKota = <KotaModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }
}
