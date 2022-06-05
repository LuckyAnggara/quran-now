import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:qurannow/views/full_quran_screen.dart';
import 'package:qurannow/views/home_screen.dart';
import 'package:qurannow/views/read_quran_screen.dart';

void main() {
  initializeDateFormatting("id_ID", null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(initialRoute: '/', getPages: [
      GetPage(name: '/', page: () => HomeScreen(), transition: Transition.fadeIn),
      GetPage(name: '/full-quran', page: () => FullQuranScreen(), transition: Transition.fadeIn),
      GetPage(name: '/read-quran', page: () => ReadQuranScreen(), transition: Transition.fadeIn),
    ]);
  }
}
