import 'package:get/get.dart';
import 'package:qurannow/models/PrayTimeModel.dart';
import 'package:qurannow/services/pray_time_services.dart';

class PrayTimeController extends GetxController {
  var isLoading = false.obs;
  Rx<JadwalSolatModel> jadwalSolat = JadwalSolatModel().obs;
  PrayTimeServices _prayTimeServices = PrayTimeServices();

  @override
  void onInit() {
    fetchJadwal();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void fetchJadwal() async {
    try {
      isLoading(true);
      var jadwal = await _prayTimeServices.fetchJadwal('1208');
      if (jadwal != null) {
        jadwalSolat(jadwal);
        update();
      }
    } finally {
      isLoading(false);
    }
  }
}
