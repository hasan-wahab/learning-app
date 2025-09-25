import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_style/app_colors.dart';
import '../../common/app_style/app_size.dart' ;
import '../../common/app_style/text_style.dart';
import '../../common/images/assets_images.dart';
import '../app_widgets/reuseable_text.dart';

Widget detailContainer(){
  return   Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      padding: AppSize.bodyPadding(horizontal: 20, vertical: 0),
      height: 536.h,
      width: 375.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.r),
          topLeft: Radius.circular(30.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSize.widgetGap(height: 35, width: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReuseableText(
                text: 'Product Design V1.0',
                textStyle: AppTStyleAndSize.secondTextStyle(),
              ),
              ReuseableText(
                text: '\$74.00',
                textStyle: AppTStyleAndSize.secondTextStyle().copyWith(
                  color: AppColors.buttonColor,
                ),
              ),
            ],
          ),
          AppSize.widgetGap(height: 4, width: 0),
          ReuseableText(
            text: '6h 14min · 24 Lessons',
            textStyle: AppTStyleAndSize.fourthSmallTextStyle(),
          ),
          ReuseableText(
            text: 'About this course',
            textStyle: AppTStyleAndSize.secondTextStyle(),
          ),
          ReuseableText(
            text:
            'Sed ut perspiciatis unde omnis iste natus error sitvoluptatem accusantium doloremque laudantium, ',
            textStyle: AppTStyleAndSize.fourthSmallTextStyle(),
          ),
          AppSize.widgetGap(height: 20,width: 0),
          Column(
            children: List.generate((3), (index) {
              return Container(
                height: 54.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReuseableText(
                      text: index.toString(),
                      textStyle: AppTStyleAndSize.secondTextStyle()
                          .copyWith(
                        color: AppColors.checkBoxBorderColor,
                      ),
                    ),
                    AppSize.widgetGap(width: 32, height: 0),
                    SizedBox(
                      height: 45.h,
                      width: 165.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReuseableText(
                            text: 'Welcome to the course',
                            textStyle:
                            AppTStyleAndSize.tFieldTextStyle()
                                .copyWith(color: Colors.black),
                          ),
                          ReuseableText(
                            text: '6:30  mins',
                            textStyle:
                            AppTStyleAndSize.fourthSmallTextStyle(),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Image.asset(AppAssetsImages.play),
                  ],
                ),
              );
            }),
          ),

        ],
      ),
    ),
  );
}