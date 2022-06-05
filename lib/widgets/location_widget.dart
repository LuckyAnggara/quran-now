import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:qurannow/constant.dart';
import 'package:qurannow/controllers/location_controller.dart';
import 'package:qurannow/controllers/pray_time_controller.dart';
import 'package:qurannow/widgets/modal_bottom_location.dart';

class LocationWidget extends StatelessWidget {
  final LocationController locationController = Get.put(LocationController());
  final prayTimeController = Get.put(PrayTimeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Location',
                style: kPrimaryFontStyle,
              ),
              Text(
                prayTimeController.kota.value.lokasi!,
                style: kSecondaryFontStyle,
              ),
            ],
          ),
          SizedBox(
            width: 24,
          ),
          GestureDetector(
            onTap: () => showBarModalBottomSheet(
              expand: false,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => ModalBottomLocation(),
            ),
            child: Icon(
              Icons.location_pin,
              size: 18,
              color: kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
