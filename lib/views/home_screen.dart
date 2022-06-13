import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qurannow/constant.dart';
import 'package:qurannow/widgets/app_bar_widget.dart';
import 'package:qurannow/widgets/ayat_of_the_day_card.dart';
import 'package:qurannow/widgets/card_date_widget.dart';
import 'package:qurannow/widgets/location_widget.dart';
import 'package:qurannow/widgets/menu_widget.dart';
import 'package:qurannow/widgets/prayer_time_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            children: [
              AppBarWidget(
                onPress: () {},
                leftIcon: Icon(Icons.dashboard_outlined),
                title: 'Home',
                rightIcon: [Icon(Icons.person_outline), Icon(Icons.settings_outlined)],
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      LocationWidget(),
                      SizedBox(
                        height: Get.height * .45,
                        width: Get.width,
                        child: Stack(
                          children: [
                            DateCardWidget(),
                            AyatOfTheDayCard(),
                          ],
                        ),
                      ),
                      PrayerTimeWidget(),
                      SizedBox(
                        height: 25,
                      ),
                      MenuWidget()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
