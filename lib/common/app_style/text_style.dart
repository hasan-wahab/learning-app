import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/common/app_style/app_colors.dart';

class AppTStyleAndSize {
  AppTStyleAndSize._();
  // Big Text Style
  static TextStyle firstTextStyle() {
    return TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  // Second Text Style
  static TextStyle secondTextStyle() {
    return TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  // Third Grey Text Style

  static TextStyle thirdTextStyle() {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.normal,
      color: Color.fromRGBO(133, 133, 151, 100),
    );
  }

  // Button Text Style
  static TextStyle buttonTextStyle() {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );
  }

  // Text Fields Text Style
  static TextStyle tFieldTextStyle() {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
      color: Color.fromRGBO(133, 133, 151, 100),
    );
  }

  // Fourt Small Text Style
  static TextStyle fourthSmallTextStyle() {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: Color.fromRGBO(133, 133, 151, 100),
    );
  }

  // APP Bar Text Style
  static TextStyle appBarTStyle() {
    return TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
  }

  static TextStyle naveBarTStyle() {
    return TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(133, 133, 151, 100),
    );
  }
}
