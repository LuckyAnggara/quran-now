import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

Color kPrimaryColor = '#ECF5F5'.toColor();
// Color kSecondaryColor = '#39E1EB'.toColor();
Color kSecondaryColor = '#ffa14ecf'.toColor();
Color kBlackColor = '#1C2C3B'.toColor();
Color kAccentColor = '#006C72'.toColor();

Color kGreySecondaryColor = '#B6B9BF'.toColor();
Color kBlackSecondaryColor = '#323232'.toColor();

TextStyle kPrimaryFontStyle = GoogleFonts.roboto(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: kBlackColor,
);

TextStyle kPrimaryWhiteFontStyle = GoogleFonts.roboto(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

TextStyle kSecondaryFontStyle = GoogleFonts.roboto(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: kSecondaryColor,
);

TextStyle kSecondaryGreyFontStyle = GoogleFonts.roboto(
  fontSize: 12,
  color: Colors.black54,
);

TextStyle kArabicFontAmiri =
    GoogleFonts.amiri(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black);

TextStyle kArabicFontNotoArabic =
    GoogleFonts.notoSansArabic(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black);

class ApiConstants {
  static String prayTimeUrl = 'https://api.myquran.com/v1/sholat/jadwal';
  static String quranUrl = 'https://api.quran.sutanlab.id';
// static String baseUrl = 'https://siapbaper.bbmakmur.com/api';
// static String baseUrl = 'http://127.0.0.1:8000/api';
// static String baseUrl = 'http://192.168.1.24:8000/api';
// static String baseUrl = 'http://192.168.166.228:8000/api';

// Bearer 4|xYmmGmblOC1j0OXcTRnE98hP5vrpYw2JtERvi3tx
}
