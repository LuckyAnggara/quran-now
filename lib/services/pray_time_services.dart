import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:qurannow/constant.dart';
import 'package:qurannow/models/PrayTimeModel.dart';

import '../models/KotaModel.dart';

class PrayTimeServices {
  final Dio _dio = Dio();

  Future<JadwalSolatModel?> fetchJadwal(String locationId) async {
    try {
      var response =
          await _dio.get('${ApiConstants.prayTimeUrl}/sholat/jadwal/$locationId/2022/05/22');
      if (response.statusCode == 200) {
        return JadwalSolatModel.fromJson(response.data['data']['jadwal']);
      } else {
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<KotaModel>?> fetchAllKota() async {
    try {
      var response = await _dio.get('${ApiConstants.prayTimeUrl}/sholat/kota/semua');
      if (response.statusCode == 200) {
        return List<KotaModel>.from(response.data.map((x) => KotaModel.fromJson(x)));
      } else {
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
