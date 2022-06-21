import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qurannow/models/SuratModelAll.dart';
import 'package:qurannow/services/quran_service.dart';

class QuranController extends GetxController {
  var isLoading = false.obs;
  RxList listSurat = <SuratModelAll>[].obs;
  QuranService _quranService = QuranService();

  var pageSize = 20.obs;

  final ScrollController scrollController = ScrollController();

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      pageSize.value = pageSize.value + 20;
      if (pageSize.value > listSurat.length) {
        pageSize(listSurat.length);
      }
    }
  }

  @override
  void onInit() {
    fetchAllSurat();
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
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
