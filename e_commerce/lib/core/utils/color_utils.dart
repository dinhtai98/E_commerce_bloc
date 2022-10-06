import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorUtils {
  static Color fromString(String colorString) {
    if (colorString == null) {
      return const Color(0xffF2F2F2);
    }

    try {
      // rgba(247, 247, 247, 0.73)
      if (colorString.substring(0, 4) == 'rgba') {
        String tempString = colorString;
        tempString = tempString.substring(4);
        tempString = tempString.replaceAll('(', '');
        tempString = tempString.replaceAll(')', '');
        List<String> rgbaValueList = tempString.split(',');
        rgbaValueList = rgbaValueList.map((e) => e.trim()).toList();

        if (rgbaValueList.length != 4) {
          throw Exception('Invalid string color');
        }

        try {
          int red = int.parse(rgbaValueList[0]);
          int green = int.parse(rgbaValueList[1]);
          int blue = int.parse(rgbaValueList[2]);
          double alpha = double.parse(rgbaValueList[3]);
          return Color.fromRGBO(red, green, blue, alpha);
        } catch (e) {
          rethrow;
        }
      }

      // #f3e2d0
      final buffer = StringBuffer();
      if (colorString.length == 6 || colorString.length == 7) {
        buffer.write('ff');
      }
      buffer.write(colorString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return const Color(0xffF2F2F2);
    }
  }

  static bool lightMode =
      MediaQuery.of(Get.context!).platformBrightness == Brightness.light;
  static Color red = const Color(0xFFD30606);
  static Color grey = const Color(0xFFAFAFAF);
  static Color green = const Color(0xFF4CAF50);
  static Color darkGreen = const Color(0xFF0D8547);
  static Color lightGrey = const Color(0xFFF8F8F8);
  static Color blue = const Color(0xFF1F00FF);
  static Color transparent = Colors.transparent;
  static Color yellow = const Color(0xFFEBDD00);
  static Color background =
      lightMode ? const Color(0xFFFFFFFF) : const Color(0xff042a49);
}
