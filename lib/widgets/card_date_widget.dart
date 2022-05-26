import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qurannow/widgets/jam_widget.dart';

import '../constant.dart';

class DateCardWidget extends StatelessWidget {
  const DateCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: const AssetImage(
              'assets/card/mosque1.jpg',
            ),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop)),
        color: Colors.black,
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      width: double.infinity,
      height: Get.height * .3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text(DateFormat('EEEE dd, MMM yyyy', 'id_ID').format(DateTime.now()).toString(),
                  style: kPrimaryWhiteFontStyle),
            ],
          ),
          const Spacer(),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Text(
                //   'Magrib dalam 5 Menit',
                //   style: kPrimaryWhiteFontStyle.copyWith(fontSize: 14),
                // ),
                ClockWidget(),
                // Text(
                //   'Jam',
                //   style: kPrimaryWhiteFontStyle.copyWith(fontSize: 50),
                // ),
                Text(
                  'Jangan lupa shalat Dhuha',
                  style: kPrimaryWhiteFontStyle.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
