import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  final _box = GetStorage();
  Rx<double> tempFontSizeArabic = 35.0.obs;
  Rx<double> tempFontSizeLatin = 16.0.obs;
  Rx<double> tempFontSizeTerjemahan = 16.0.obs;

  // var fontSizeTerjemahan = false.obs;
  // var fontSizeLatin = false.obs;
  // var fontSizeArabic = false.obs;
  // var terjemahan = false.obs;
  // var latin = false.obs;
  // var arabic = false.obs;
  // var darkMode = false.obs;

  @override
  void onInit() {
    // TODO: implement initState
    super.onInit();
    _box.writeIfNull('terjemahan', false);
    _box.writeIfNull('latin', false);
    _box.writeIfNull('arabic', true);
    _box.writeIfNull('darkMode', false);
    _box.writeIfNull('fontSizeTerjemahan', 16.0);
    _box.writeIfNull('fontSizeLatin', 16.0);
    _box.writeIfNull('fontSizeArabic', 35.0);
    _box.writeIfNull('darkMode', false);
  }

  get fontSizeTerjemahan => _box.read('fontSizeTerjemahan').toDouble();
  get fontSizeLatin => _box.read('fontSizeLatin').toDouble();
  get fontSizeArabic => _box.read('fontSizeArabic').toDouble();
  get terjemahan => _box.read('terjemahan');
  get latin => _box.read('latin');
  get arabic => _box.read('arabic');
  get darkMode => _box.read('darkMode');

  set updateFontSizeTerjemahan(double fontSize) {
    tempFontSizeTerjemahan.value = fontSize;
    update(['updateFontSizeTerjemahan']);
  }

  set updateFontSizeLatin(double fontSize) {
    tempFontSizeLatin.value = fontSize;
    update(['updateFontSizeLatin']);
  }

  set updateFontSizeArabic(double fontSize) {
    tempFontSizeArabic.value = fontSize;
    update(['updateFontSizeArabic']);
  }

  void simpanFontSize() {
    _box.write('fontSizeTerjemahan', tempFontSizeTerjemahan.toDouble());
    _box.write('fontSizeLatin', tempFontSizeLatin.toDouble());
    _box.write('fontSizeArabic', tempFontSizeArabic.toDouble());
  }

  set updateTerjemahan(bool value) {
    _box.write('terjemahan', value);
  }

  set updateArabic(bool value) {
    _box.write('arabic', value);
  }

  set updateLatin(bool value) {
    _box.write('latin', value);
  }

  set updateDarkMode(bool value) {
    _box.write('darkMode', value);
  }
}
