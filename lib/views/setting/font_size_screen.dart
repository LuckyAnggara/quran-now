import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qurannow/constant.dart';
import 'package:qurannow/controllers/settings_controller.dart';
import 'package:qurannow/widgets/app_bar_widget.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FontSizeScreenSetting extends StatelessWidget {
  var settingsController = Get.find<SettingsController>();

  FontSizeScreenSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              settingsController.simpanFontSize();
              settingsController.update(['settingUpdate']);
              Get.back();
            },
            backgroundColor: kSecondaryColor.withOpacity(1),
            label: const Text('Simpan'),
            icon: const Icon(Icons.save),
          ),
          backgroundColor: kPrimaryColor,
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Column(
              children: [
                AppBarWidget(
                  onPress: () {
                    Get.back();
                  },
                  leftIcon: Icon(Icons.arrow_back_ios),
                  title: 'Font Size',
                  rightIcon: [],
                ),
                SizedBox(
                  child: TabBar(
                    tabs: [
                      Text(
                        'Arabic',
                        style: kPrimaryFontStyle,
                      ),
                      Text('Latin', style: kPrimaryFontStyle),
                      Text('Terjemahan', style: kPrimaryFontStyle),
                    ],
                  ),
                ),
                SizedBox(
                    height: Get.height * .7,
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        PanelArabic(settingsController: settingsController),
                        PanelLatin(settingsController: settingsController),
                        PanelTerjemahan(settingsController: settingsController)
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PanelArabic extends StatelessWidget {
  PanelArabic({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: GetBuilder(
            init: settingsController,
            id: 'updateFontSizeArabic',
            builder: (context) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Text('Arabic'),
                  ),
                  Container(
                    height: Get.height * .4,
                    child: Center(
                      child: Text(
                        "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ قُلْ أَعُوذُ بِرَبِّ النَّاسِ",
                        style: kArabicFontAmiri.copyWith(
                          fontSize:
                              settingsController.tempFontSizeArabic.toDouble(),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: SfSlider(
                      min: 10.0,
                      max: 60.0,
                      value: settingsController.tempFontSizeArabic.toDouble(),
                      interval: 10,
                      showTicks: true,
                      showLabels: true,
                      enableTooltip: true,
                      minorTicksPerInterval: 0,
                      stepSize: 1.0,
                      onChanged: (dynamic value) {
                        settingsController.updateFontSizeArabic = value;
                      },
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}

class PanelLatin extends StatelessWidget {
  PanelLatin({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: GetBuilder(
            init: settingsController,
            id: 'updateFontSizeLatin',
            builder: (context) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Text('Arabic'),
                  ),
                  Container(
                    height: Get.height * .4,
                    child: Center(
                      child: Html(
                        data:
                            """bismi <strong>al</strong>l<u>aa</u>hi <strong>al</strong>rra<u>h</u>m<u>aa</u>ni <strong>al</strong>rra<u>h</u>iim<strong>i</strong>""",
                        style: {
                          "body": Style(
                            fontSize: FontSize(
                              settingsController.tempFontSizeLatin.toDouble(),
                            ),
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: SfSlider(
                      min: 10.0,
                      max: 60.0,
                      value: settingsController.tempFontSizeLatin.toDouble(),
                      interval: 10,
                      showTicks: true,
                      showLabels: true,
                      enableTooltip: true,
                      minorTicksPerInterval: 0,
                      stepSize: 1.0,
                      onChanged: (dynamic value) {
                        settingsController.updateFontSizeLatin = value;
                      },
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}

class PanelTerjemahan extends StatelessWidget {
  PanelTerjemahan({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: GetBuilder(
            init: settingsController,
            id: 'updateFontSizeTerjemahan',
            builder: (context) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Text('Arabic'),
                  ),
                  Container(
                    height: Get.height * .4,
                    child: Center(
                        child: Text(
                      "Dengan nama Allah Yang Maha Pengasih, Maha Penyayang",
                      textAlign: TextAlign.start,
                      style: kPrimaryFontStyle.copyWith(
                          fontSize: settingsController.tempFontSizeTerjemahan
                              .toDouble(),
                          fontWeight: FontWeight.w500),
                    )),
                  ),
                  Container(
                    width: double.infinity,
                    child: SfSlider(
                      min: 10.0,
                      max: 60.0,
                      value:
                          settingsController.tempFontSizeTerjemahan.toDouble(),
                      interval: 10,
                      showTicks: true,
                      showLabels: true,
                      enableTooltip: true,
                      minorTicksPerInterval: 0,
                      stepSize: 1.0,
                      onChanged: (dynamic value) {
                        settingsController.updateFontSizeTerjemahan = value;
                      },
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
