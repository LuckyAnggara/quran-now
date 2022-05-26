import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qurannow/constant.dart';
import 'package:qurannow/controllers/pray_time_controller.dart';

class PrayerTimeWidget extends StatelessWidget {
  final PrayTimeController prayTimeController = Get.put(PrayTimeController());

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: kGreySecondaryColor.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Row(children: [
              Text(
                'Jadwal Shalat',
                style: kPrimaryFontStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Text(
                DateFormat('EEEE dd, MMM yyyy', 'id_ID').format(DateTime.now()).toString(),
                textAlign: TextAlign.start,
                style: kPrimaryFontStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black54),
              ),
              // Icon(
              //   Icons.open_in_full,
              //   size: 20,
              //   color: kSecondaryColor,
              // )
            ]),
            SizedBox(
              height: 110,
              child: GetBuilder<PrayTimeController>(
                  init: PrayTimeController(),
                  builder: (value) {
                    var data = value.jadwalSolat.value;

                    return ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        PrayerTimeCard(time: data.imsak, name: 'Imsak'),
                        PrayerTimeCard(time: data.subuh, name: 'Subuh'),
                        PrayerTimeCard(time: data.terbit, name: 'Terbit'),
                        PrayerTimeCard(time: data.dhuha, name: 'Dhuha'),
                        PrayerTimeCard(time: data.dzuhur, name: 'Dzuhur'),
                        PrayerTimeCard(time: data.ashar, name: 'Ashar'),
                        PrayerTimeCard(time: data.maghrib, name: 'Maghrib'),
                        PrayerTimeCard(time: data.isya, name: 'Isya'),
                      ],
                    );
                  }),
            )
          ],
        ));
  }
}

class PrayerTimeCard extends StatelessWidget {
  final String? time;
  final String? name;
  PrayerTimeCard({Key? key, required this.time, required this.name}) : super(key: key);
  // var dt = DateTime.now();
  // bool isPast = false;

  @override
  Widget build(BuildContext context) {
    // var timeDt = DateFormat('hh').parse(time!);

    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            width: 70,
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: time != null
                ? Align(
                    alignment: Alignment.center,
                    child: Text(
                      time!,
                      style: kPrimaryWhiteFontStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ))
                : SpinKitWave(
                    color: kSecondaryColor,
                    size: 24,
                  ),
          ),
          Text(
            name!,
            style: kPrimaryFontStyle.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
