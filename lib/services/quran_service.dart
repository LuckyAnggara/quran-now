import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:qurannow/constant.dart';
import 'package:qurannow/models/SurahDetailModel.dart';
import 'package:qurannow/models/SuratModelAll.dart';
import 'package:qurannow/models/quran/Surat.dart';

class QuranService {
  final Dio _dio = Dio();

  Future<List<SuratModelAll>?> fetchAllSurat() async {
    var url = Uri.parse('${ApiConstants.quranUrl}/surat');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<SuratModelAll> result = List<SuratModelAll>.from(
            jsonDecode(response.body).map((x) => SuratModelAll.fromJson(x)));
        return result;
      } else {
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Surat?> fetchSurat(String suratNumber) async {
    var url = Uri.parse('${ApiConstants.quranUrl}/surat/$suratNumber');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Surat result = Surat.fromJson(jsonDecode(response.body));
        return result;
      } else {
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  // Versi 1
  // Future<SuratModelSatuan?> fetchSurat(String suratNumber) async {
  //   var url = Uri.parse('${ApiConstants.quranUrl}/surah/$suratNumber');
  //
  //   try {
  //     var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       SuratModelSatuan result = SuratModelSatuan.fromJson(jsonDecode(response.body)["data"]);
  //
  //       return result;
  //     } else {
  //       throw Exception();
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   return null;
  // }

// Versi 2
  Future<SurahDetailModel?> fetchAudio(String suratNumber) async {
    // var url = Uri.parse(
    //     '${ApiConstants.quranUrlv2}/surah/$suratNumber/editions/quran-simple-enchanced,ar.alafasy,id.indonesian');
    var url = Uri.parse(
        '${ApiConstants.quranUrlv2}/surah/$suratNumber/editions/ar.alafasy');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        SurahDetailModel result =
            SurahDetailModel.fromJson(jsonDecode(response.body));
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
