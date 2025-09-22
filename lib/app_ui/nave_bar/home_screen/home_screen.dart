import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';

import 'package:foodi/app_ui/nave_bar/home_screen/home_screen_widgets.dart';
import 'package:foodi/common/app_style/app_colors.dart';

import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';
import 'package:foodi/common/images/assets_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final angle1 = math.pi * 1.0;
  final angle2 = math.pi * 2.0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      // Starting column
      children: [
        // First part
        SizedBox(
          height: 223.h,
          width: 375.w,
          child: Stack(children: [firstBlueContainer(), timerWidget()]),
        ),
        // Second part -- row
        AppSize.widgetGap(height: 14.h, width: 0),
        // horizontal list of Card
        horizontalListOfCard(),
        AppSize.widgetGap(height: 9.35, width: 9),
        // Learning plan Widget
        learningPlanWidget(angle1: angle1, angle2: angle2),
        Container(
          margin: AppSize.bodyPadding(horizontal: 20, vertical: 0),
          height: 120.h,
          width: 335.w,
          decoration: BoxDecoration(
            color: AppColors.meetUpCardColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Stack(
            children: [

              Padding(
                padding: AppSize.bodyPadding2(top: 26.64,left: 21.42),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: ReuseableText(
                    text: 'Meetup',
                    textStyle: AppTStyleAndSize.firstTextStyle().copyWith(
                      color: AppColors.meetUpTextColor,
                      fontSize: 24.36,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: AppSize.bodyPadding2(left: 21.74),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ReuseableText(
                    text: 'Off-line exchange of learning experiences',
                    textStyle: AppTStyleAndSize.firstTextStyle().copyWith(
                      color: AppColors.meetUpTextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: AppSize.bodyPadding2(right: 13.80),
                child: Align(

                  alignment: Alignment.topRight,
                  child: Container(

                    decoration: BoxDecoration(
                        color: Colors.white24,
                      shape: BoxShape.circle
                    ),

                    height: 100.0.h,
                    width: 100.0.w,
                    child: Stack(

                      children: [
                        Align(
                          alignment: Alignment.center,
                        child: SizedBox(
                        height: 50.h,
                        width: 40.w,

                        child: Image.asset(AppAssetsImages.avatar),),
                      ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40.h,
                                width: 40.w,

                                child: Image.asset(AppAssetsImages.secondRowImage),
                              ),
                              SizedBox(
                                height: 40.h,
                                width: 40.w,

                                child: Image.asset(AppAssetsImages.meetUpImage),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
