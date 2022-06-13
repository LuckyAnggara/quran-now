import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  final _box = GetStorage();

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
    _box.writeIfNull('arabic', false);
    _box.writeIfNull('darkMode', false);
    _box.writeIfNull('terjamahanFontSize', false);
    _box.writeIfNull('latinFontSize', false);
    _box.writeIfNull('arabicFontSize', false);
    _box.writeIfNull('darkMode', false);
  }

  get fontSizeTerjemahan => _box.read('terjemahanFontSize');
  get fontSizeLatin => _box.read('fontLatinSize');
  get fontSizeArabic => _box.read('fontArabicSize');
  get terjemahan => _box.read('terjemahan');
  get latin => _box.read('latin');
  get arabic => _box.read('arabic');
  get darkMode => _box.read('darkMode');

  set updateFontSizeTerjemahan(int fontSize) {
    _box.write('terjamahanFontSize', fontSize);
  }

  set updateFontSizeLatin(int fontSize) {
    _box.write('latinFontSize', fontSize);
  }

  set updateFontSizeArabic(int fontSize) {
    _box.write('arabicFontSize', fontSize);
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
