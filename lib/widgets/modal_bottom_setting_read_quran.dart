import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:qurannow/constant.dart';
import 'package:qurannow/controllers/settings_controller.dart';

class ModalBottomSettingQuran extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  ModalBottomSettingQuran({Key? key, required this.child, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Material(
          color: backgroundColor,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(12),
          child: child,
        ),
      ),
    );
  }
}

Future<T> showFloatingModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
}) async {
  final result = await showCustomModalBottomSheet(
      context: context,
      builder: builder,
      containerWidget: (_, animation, child) => ModalBottomSettingQuran(
            child: ModalFitSetting(),
          ),
      expand: false);

  return result;
}

class ModalFitSetting extends StatelessWidget {
  ModalFitSetting({Key? key}) : super(key: key);
  SettingsController settingController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: GetBuilder(
          id: 'settingUpdate',
          init: settingController,
          builder: (ctx) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          8,
                        ),
                      ),
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.all(
                      10,
                    ),
                    child: Text(
                      'Settings',
                      style: kPrimaryFontStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Arabic'),
                  leading: Icon(Icons.text_fields),
                  trailing: Switch(
                    value: settingController.arabic,
                    onChanged: (value) {
                      settingController.updateArabic = value;
                      settingController.update(['settingUpdate']);
                    },
                    activeTrackColor: kSecondaryColor.withOpacity(0.2),
                    activeColor: kSecondaryColor.withOpacity(1),
                  ),
                ),
                ListTile(
                  title: Text('Terjemahan'),
                  leading: Icon(Icons.language),
                  trailing: Switch(
                    value: settingController.terjemahan,
                    onChanged: (value) {
                      settingController.updateTerjemahan = value;
                      settingController.update(['settingUpdate']);
                    },
                    activeTrackColor: kSecondaryColor.withOpacity(0.2),
                    activeColor: kSecondaryColor.withOpacity(1),
                  ),
                ),
                ListTile(
                  title: Text('Latin'),
                  leading: Icon(Icons.translate),
                  trailing: Switch(
                    value: settingController.latin,
                    onChanged: (value) {
                      settingController.updateLatin = value;
                      settingController.update(['settingUpdate']);
                    },
                    activeTrackColor: kSecondaryColor.withOpacity(0.2),
                    activeColor: kSecondaryColor.withOpacity(1),
                  ),
                ),
                ListTile(
                  title: Text('Ukuran Font'),
                  leading: Icon(Icons.format_size),
                  trailing: GestureDetector(
                    onTap: () {
                      Get.toNamed('font-size-screen-setting');
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Mode Gelap'),
                  leading: Icon(Icons.dark_mode),
                  trailing: Switch(
                    value: settingController.darkMode,
                    onChanged: (value) {
                      settingController.updateDarkMode = value;
                      settingController.update(['settingUpdate']);
                    },
                    activeTrackColor: kSecondaryColor.withOpacity(0.2),
                    activeColor: kSecondaryColor.withOpacity(1),
                  ),
                ),
              ],
            );
          }),
    ));
  }
}

class ModalFitFont extends StatelessWidget {
  const ModalFitFont({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            ListTile(
              title: Text('Terjemahan'),
              leading: Icon(Icons.language),
              trailing: Switch(
                value: true,
                onChanged: (value) {},
                activeTrackColor: kSecondaryColor.withOpacity(0.2),
                activeColor: kSecondaryColor.withOpacity(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
