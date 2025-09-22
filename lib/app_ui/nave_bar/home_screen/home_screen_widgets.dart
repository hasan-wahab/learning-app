import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';
import 'package:foodi/common/images/assets_images.dart';

import '../../app_widgets/app_button.dart';

Widget firstBlueContainer() {
  return Container(
    color: AppColors.buttonColor,
    height: 183.h,
    width: 375.w,
    padding: AppSize.bodyPadding(horizontal: 20, vertical: 0),
    child: Column(
      children: [
        AppSize.widgetGap(height: 61, width: 0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // First title and sub title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 36.h,
                  width: 118.w,
                  child: ReuseableText(
                    text: 'Hi,Hasan',
                    textStyle: AppTStyleAndSize.firstTextStyle().copyWith(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  height: 21.h,
                  width: 128.w,
                  child: ReuseableText(
text: 'Let’s start learning',
                    textStyle: AppTStyleAndSize.tFieldTextStyle().copyWith(
                      color: Color.fromRGBO(255, 255, 255, 100),
                    ),
                  ),
                ),
              ],
            ),

            // Circle avatar
            SizedBox(
              height: 49.98.h,
              width: 36.w,
              child: Stack(
                children: [
                  Container(
                    height: 36.h,
                    width: 36.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.courseCardColor1,
                    ),
                  ),

                  SizedBox(
                    height: 40.h,
                    width: 36.w,
                    child: Image.asset(AppAssetsImages.avatar),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
// Timer Widget

Widget timerWidget() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      padding: AppSize.bodyPadding(horizontal: 16, vertical: 20),
      width: 335.w,
      height: 96.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0.1,
            blurRadius: 1,
            offset: Offset(1, 5),
            color: AppColors.courseCardColor2,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReuseableText(
               text:  'Learned today',
                textStyle: AppTStyleAndSize.thirdTextStyle().copyWith(fontSize: 12),
              ),
              ReuseableText(
text: 'My courses',
                textStyle: AppTStyleAndSize.appBarTStyle().copyWith(
                  color: AppColors.buttonColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ],
          ),

          Row(
            children: [
              ReuseableText(
              text:   '40 min',
                textStyle: AppTStyleAndSize.firstTextStyle().copyWith(fontSize: 20),
              ),
              ReuseableText(text: '/ 60min', textStyle: AppTStyleAndSize.thirdTextStyle()),
            ],
          ),
          Row(
            children: [
              Container(
                width: 303.w,
                height: 6.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    bottomLeft: Radius.circular(12.r),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.courseCardColor2,
                      AppColors.leanierColorHighOpacity,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget horizontalListOfCard(){
  return   SizedBox(
    height: 154.h,

    child: ListView.builder(
      itemCount: 2,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: AppSize.bodyPadding2(left: 20),
          child: Container(
            padding: AppSize.bodyPadding2(top: 18.5, left: 18.5),
            height: 154.h,
            width: 249.w,
            decoration: BoxDecoration(
              color: AppColors.homeScrSecondCardColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 134.22.h,
                    width: 118.69.w,
                    child: Image.asset(AppAssetsImages.secondRowImage),
                  ),
                ),
                ReuseableText(
                  text: 'What do you want to learn today',
                  textStyle: AppTStyleAndSize.secondTextStyle().copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Padding(
                  padding: AppSize.bodyPadding2(bottom: 18.5),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: AppBtn(
                      width: 85,
                      height: 31,
                      text: 'Get Started',
                      textStyle: AppTStyleAndSize.buttonTextStyle()
                          .copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
Widget circleWidget({required angle,required String text}){
  return Row(
    spacing: AppSize.rowSpacing(width: 13),
    children: [
      Container(
        height: 18.h,
        width: 18.w,
        decoration: BoxDecoration(
          gradient: angle != math.pi * 0.0
              ? SweepGradient(
            colors: [Color.fromRGBO(112, 112, 112, 100), Color.fromRGBO(244, 243, 253, 100)],
            endAngle: angle,
          )
              : null,
          shape: BoxShape.circle,
          color: angle == math.pi * 0.0 ? Colors.grey : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 10.h,
              width: 10.w,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
      ReuseableText(
     text:   text,
        textStyle: AppTStyleAndSize.thirdTextStyle().copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    ],
  );
}
Widget learningPlanWidget({required angle1 ,required angle2}){
  return SizedBox(
    height: 181.h,
    width: 375.w,

    child: Column(
      children: [
        Padding(
          padding: AppSize.bodyPadding2(left: 20),
          child: Row(
            children: [
              ReuseableText(
               text:  'Learning plan',
                textStyle: AppTStyleAndSize.thirdTextStyle().copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 133.h,
          width: 335.w,
          child: Card(
              color: Colors.white,
              child: Padding(
                padding: AppSize.bodyPadding2(top: 25,left: 16,right: 16),
                child: Column(
                  spacing: AppSize.colomnSpacing(height: 18),
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        circleWidget(angle: angle1,text: 'Packaging design'),
                        Row(
                          children: [
                            Text('40'),
                            Text('/48',style: AppTStyleAndSize.fourthSmallTextStyle(),),
                          ],
                        ),
                      ],
                    ),  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        circleWidget(angle: angle2,text: 'Product design'),
                        Row(
                          children: [
                            Text('40'),
                            Text('/48',style: AppTStyleAndSize.fourthSmallTextStyle(),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
          ),
        ),
      ],
    ),
  );
}
