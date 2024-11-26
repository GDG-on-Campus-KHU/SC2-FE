import 'package:flutter/material.dart';

class ColorManager {
  static Color background = HexColor.fromHex("#f8f5f6");
  static Color button = HexColor.fromHex("#E31C1C");
  static Color mainText = HexColor.fromHex("#1C0D0D");
  static Color subText = HexColor.fromHex("#964F4F");
  static Color card = HexColor.fromHex("#f4e9e8");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');

    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }

    return Color(int.parse(hexColorString, radix: 16));
  }
}
