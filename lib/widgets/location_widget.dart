import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:qurannow/constant.dart';
import 'package:qurannow/controllers/location_controller.dart';

class LocationWidget extends StatelessWidget {
  LocationWidget({Key? key}) : super(key: key);

  final LocationController locationController = Get.put(LocationController());

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
                'Auto Detect',
                style: kSecondaryFontStyle,
              )
            ],
          ),
          SizedBox(
            width: 24,
          ),
          Obx(() {
            if (locationController.isSearching.value) {
              return SpinKitChasingDots(
                color: kSecondaryColor,
                size: 18,
              );
            } else {
              return GestureDetector(
                onTap: () {
                  locationController.getCurrentLocation();
                },
                child: Icon(
                  Icons.refresh_outlined,
                  size: 18,
                  color: kSecondaryColor,
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
