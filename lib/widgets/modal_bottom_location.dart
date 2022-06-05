import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:qurannow/constant.dart';
import 'package:qurannow/controllers/pray_time_controller.dart';

class ModalBottomLocation extends StatelessWidget {
  final bool reverse;

  ModalBottomLocation({Key? key, this.reverse = false}) : super(key: key);
  final prayTimeController = Get.find<PrayTimeController>();

  @override
  Widget build(BuildContext context) {
    prayTimeController.getAllKota();
    return Material(
        child: CupertinoPageScaffold(
      navigationBar:
          CupertinoNavigationBar(leading: Container(), middle: Text('Daftar Kota/Kabupaten')),
      child: SafeArea(
        bottom: false,
        child: Obx(() {
          if (prayTimeController.isLoadingKota.value) {
            return SpinKitWave(
              color: kSecondaryColor,
            );
          } else {
            return ListView(
              reverse: reverse,
              shrinkWrap: true,
              controller: ModalScrollController.of(context),
              physics: ClampingScrollPhysics(),
              children: ListTile.divideTiles(
                context: context,
                tiles: List.generate(
                  prayTimeController.listKota.length,
                  (index) => ListTile(
                      title: Text(prayTimeController.listKota[index].lokasi),
                      onTap: () {
                        prayTimeController.setKota(prayTimeController.listKota[index]);
                      }),
                ),
              ).toList(),
            );
          }
        }),
      ),
    ));
  }
}
