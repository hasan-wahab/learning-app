// image Widget

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';

import '../../app_routes/app_routes.dart';
import '../app_widgets/app_button.dart';

Widget onBoadingImage({required String image, VoidCallback? onTap}) =>
    InkWell(
      onTap: onTap,
      child: SizedBox(height: 260.h, width: 260.w, child: Image.asset(image)));

// first widget
Widget firstText({required String text}) => SizedBox(
  height: 66.h,
  width: 168.w,
  child: ReuseableText(
    textAlign: TextAlign.center,
    text:text,
    textStyle: AppTStyleAndSize.secondTextStyle(),
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
  child: ReuseableText(
    textAlign: TextAlign.center,
    text: text,
    textStyle: AppTStyleAndSize.thirdTextStyle(),
  ),
);

// Three dots Widget

Widget threeDots({required int currentValue}) {
  return Row(
    spacing: AppSize.rowSpacing(width: 10),
    mainAxisSize: MainAxisSize.min,
    children: List.generate((3), (index){
      return Container(
        height: 5.h,
        width:currentValue==index? 28.h:9,
        decoration: BoxDecoration(
          color: currentValue==index?AppColors.buttonColor:AppColors.courseCardColor1,
          borderRadius: BorderRadius.circular(5.w),
        ),
      );
    }),
  );
}

Widget circleButton({required BuildContext context,VoidCallback? onTap}){
  return   InkWell(
    onTap: onTap,
    child: Container(
      height: 70.h,
      width: 70.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.buttonColor,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          AppBtn(

            width: 55,
            height: 55,
            borderRadius: 30,
            icon: Icon(Icons.arrow_forward, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
