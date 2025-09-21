// image Widget

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';

Widget onBoadingImage({required String image, VoidCallback? onTap}) =>
    InkWell(
      onTap: onTap,
      child: SizedBox(height: 260.h, width: 260.w, child: Image.asset(image)));

// first widget
Widget firstText({required String text}) => SizedBox(
  height: 66.h,
  width: 168.w,
  child: Text(
    textAlign: TextAlign.center,
    text,
    style: AppTStyleAndSize.secondTextStyle(),
  ),
);
// first widget
Widget secondText({
  required String text,
  double height = 48,
  double width = 198,
}) => SizedBox(
  height: height.h,
  width: width.w,
  child: Text(
    textAlign: TextAlign.center,
    text,
    style: AppTStyleAndSize.thirdTextStyle(),
  ),
);

// Three dots Widget

Widget threeDots() {
  return Row(
    spacing: AppSize.rowSpacing(width: 10),
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        height: 5.h,
        width: 28.h,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(5.w),
        ),
      ),
      Container(
        height: 5.h,
        width: 9.h,
        decoration: BoxDecoration(
          color: AppColors.courseCardColor1,
          borderRadius: BorderRadius.circular(5.w),
        ),
      ),
      Container(
        height: 5.h,
        width: 9.h,
        decoration: BoxDecoration(
          color: AppColors.courseCardColor1,
          borderRadius: BorderRadius.circular(5.w),
        ),
      ),
    ],
  );
}
