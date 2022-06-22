import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:qurannow/models/SurahDetailModel.dart';
import 'package:qurannow/models/quran/Surat.dart';
import 'package:qurannow/services/quran_service.dart';

class ReadQuranController extends GetxController {
  var isLoading = false.obs;
  var isAudioLoad = false.obs;
  var isStateLoadingAudio = false.obs;
  final QuranService _quranService = QuranService();
  var audio = Rxn<SurahDetailModel?>();
  var surat = Rxn<Surat?>();
  final player = AudioPlayer();
  var playIndex = ''.obs;
  var isAudioPlay = false.obs;

  var pageSize = 5.obs;

  final ScrollController scrollController = ScrollController();

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

    scrollController.addListener(_scrollListener);

    super.onInit();
  }

  @override
  void dispose() {
    player.dispose();
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      pageSize.value = pageSize.value + 10;
      print(pageSize.value);
      if (pageSize.value > surat.value!.jumlahAyat) {
        pageSize(surat.value!.jumlahAyat);
      }
    }
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
      var data = await _quranService.fetchSurat(suratNumber);
      // var data = await _quranService.fetchSuratv2(suratNumber);
      if (data != null) {
        surat.value = data;
      }
    } finally {
      fetchAudio(suratNumber).then((value) {
        isLoading(false);
        audio.value = value;

        update(['updateListAyat']);
        update(['updateAudio']);
      });
    }
  }

  Future fetchAudio(suratNumber) async {
    var data = await _quranService.fetchAudio(suratNumber);
    return data;
  }

  Future ss() async {
    sleep(const Duration(seconds: 1));
  }
}
