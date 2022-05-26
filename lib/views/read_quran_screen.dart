import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qurannow/widgets/app_bar_widget.dart';

class ReadQuranScreen extends StatelessWidget {
  const ReadQuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Column(
              children: [
                AppBarWidget(
                  onPress: () {
                    Get.back();
                  },
                  leftIcon: Icon(Icons.arrow_back_ios),
                  title: 'Al-Fatihah',
                  rightIcon: [
                    Icon(Icons.bookmark_outline),
                    Icon(Icons.settings_outlined),
                  ],
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text('AlFatihah'),
                          Text('Pembukaan'),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            )),
      ),
    );
  }
}
