import 'dart:io';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:qurannow/models/SurahDetailModel.dart';
import 'package:qurannow/services/quran_service.dart';

class ReadQuranController extends GetxController {
  var isLoading = false.obs;
  var isStateLoadingAudio = false.obs;
  QuranService _quranService = QuranService();
  var surat = Rxn<SurahDetailModel>();
  final player = AudioPlayer();
  var playIndex = ''.obs;
  var isAudioPlay = false.obs;

  @override
  void onInit() {
    player.playerStateStream.listen((event) {
      switch (event.processingState) {
        case ProcessingState.completed:
          playIndex(0.toString());
          update(['updatePlay']);
          break;
        case ProcessingState.ready:
          isStateLoadingAudio(false);
          update(['updatePlay']);
          break;
        case ProcessingState.idle:
          break;
        case ProcessingState.loading:
          isStateLoadingAudio(true);
          break;
        case ProcessingState.buffering:
          break;
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void pauseAudio() {
    player.pause();
    playIndex(0.toString());
    update(['updatePlay']);
  }

  void playAudio(String url, int number) async {
    await player.setUrl(url);
    player.play();
    playIndex(number.toString());
    update(['updatePlay']);
  }

  void fetchSurat(suratNumber) async {
    try {
      isLoading(true);
      // var data = await _quranService.fetchSurat(suratNumber);
      var data = await _quranService.fetchSuratv2(suratNumber);
      if (data != null) {
        surat.value = data;
      }
    } finally {
      isLoading(false);
      update();
    }
  }

  Future ss() async {
    sleep(const Duration(seconds: 1));
  }
}
