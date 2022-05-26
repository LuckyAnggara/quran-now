import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:qurannow/constant.dart';
import 'package:qurannow/models/SuratModelAll.dart';

class QuranService {
  final Dio _dio = Dio();

  Future<List<SuratModelAll>?> fetchAllSurat() async {
    try {
      var response = await _dio.get('${ApiConstants.quranUrl}/surah/');
      if (response.statusCode == 200) {
        List<SuratModelAll> result =
            List<SuratModelAll>.from(response.data["data"].map((x) => SuratModelAll.fromJson(x)));
        // SuratModel.fromJson(response.data['data']);
        return result;
      } else {
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<SuratModelAll>?> fetchSurat(int suratNumber) async {
    try {
      var response = await _dio.get('${ApiConstants.quranUrl}/surah/$suratNumber');
      if (response.statusCode == 200) {
        List<SuratModelAll> result =
            List<SuratModelAll>.from(response.data["data"].map((x) => SuratModelAll.fromJson(x)));
        // SuratModel.fromJson(response.data['data']);
        return result;
      } else {
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
