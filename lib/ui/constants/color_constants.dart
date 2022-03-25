import 'dart:ui';
import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class ColorConstants {
  // Typography Colors
  static Color woodsmokeTypographyColor = hexToColor('#0E0E11');
  static Color boulderTypographyColor = hexToColor('#797979');
  static Color scarpaflowTypographyColor = hexToColor('#575767');
  static Color frenchgrayTypographyColor = hexToColor('#B9B9BE');
  static Color altoTypographyColor = hexToColor('#D0D0D0');
  static Color altolightTypographyColor = hexToColor('#DADADA');
  // App Colors 
  static Color sharkBackgroundColor = hexToColor('#282D35');
  static Color dodgerblueAppColor = hexToColor('#1294F2');
  static Color blueribbonAppColor = hexToColor('#2E5CFF');
  static Color punchAppColor = hexToColor('#DB4437');
  static Color darkwoodsmokeAppColor = hexToColor('#141419');
  static Color darkboulderAppColor = hexToColor('#797979');
  static Color flamingoAppColor = hexToColor('#EF4A3C');
  static Color whitealabasterAppColor = hexToColor('#F8F8F8');
}