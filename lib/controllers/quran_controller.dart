import 'package:get/get.dart';
import 'package:qurannow/models/SuratModelAll.dart';
import 'package:qurannow/services/quran_service.dart';

class QuranController extends GetxController {
  var isLoading = false.obs;
  RxList listSurat = <SuratModelAll>[].obs;
  QuranService _quranService = QuranService();

  @override
  void onInit() {
    fetchAllSurat();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void fetchAllSurat() async {
    try {
      isLoading(true);
      var data = await _quranService.fetchAllSurat();
      if (data != null) {
        listSurat.value = data;
      }
    } finally {
      isLoading(false);
    }
  }
}
