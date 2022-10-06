import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyleUtils {
  static TextStyle thin(double size) => TextStyle(
        fontWeight: FontWeight.w100,
        fontSize: size.sp,
      );
  static TextStyle light(double size) => TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: size.sp,
      );

  static TextStyle regular(double size) => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: size.sp,
      );
  static TextStyle medium(double size) => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: size.sp,
      );

  static TextStyle bold(double size) => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: size.sp,
      );

  static TextStyle extraBold(double size) => TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: size.sp,
      );
}
