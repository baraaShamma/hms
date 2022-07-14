import 'package:flutter/material.dart';

const Color mainColor = Color.fromRGBO(0, 172, 193, 1);
const Color darkGreyClr = Color(0xFF121212);
const Color pinkClr = Color(0xFFff4667);
const Color kCOlor1 = Color(0xFFEEE9F9);
const Color kCOlor2 = Color(0xFFD4C8EF);
const Color kCOlor3 = Color(0xFFB7A4E5);
const Color kCOlor4 = Color(0xFF9A80DA);
const Color kCOlor5 = Color(0xFF8464D2);
const Color kCOlor6 = Color(0xFF6642C5);
const Color kCOlor7 = Color(0xFF73969E);
const Color kCOlor8 = Color(0xFF5131B7);
const Color darkSettings = Color(0xFF31616C);
const Color accountSettings = Color(0xff73bc65);
const Color logOutSettings = Color(0xFF234C57);
const Color notiSettings = Color(0xffdf5862);
const Color languageSettings = Color(0xffCB256C);

class ThemesApp {
  static final light = ThemeData(
    primaryColor: mainColor,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}
