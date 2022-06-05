import 'package:get/get.dart';
import 'package:qurannow/models/PrayTimeModel.dart';
import 'package:qurannow/services/pray_time_services.dart';

import '../models/KotaModel.dart';

class PrayTimeController extends GetxController {
  var isLoading = false.obs;
  var isLoadingKota = false.obs;
  var kota = KotaModel(lokasi: 'kosong', id: '0').obs;

  RxList listKota = <KotaModel>[].obs;
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

  void setKota(KotaModel kota) {
    kota = kota;
    update(['updateKota']);
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

  Future<void> getAllKota() async {
    try {
      isLoading(true);
      var data = await _prayTimeServices.fetchAllKota();
      if (data != null) {
        listKota.value = data;
      }
    } finally {
      isLoading(false);
    }
  }
}
