import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';
import 'package:foodi/common/images/assets_images.dart';

Widget paymentCardList({required int index,required int currentIndex,VoidCallback? onTap}) {
  return  InkWell(
    onTap: onTap,
    child: Padding(
      padding: AppSize.bodyPadding2(bottom: 16),
      child: SizedBox(
        height: 92.h,
        width: 335.w,
        child: Card(
          // color: Color.fromRGBO(244, 215, 210, 100),
          color:Colors.white,
          child: Padding(
            padding: AppSize.bodyPadding2(left: 16, right: 16),
            child: Row(
              children: [
                Container(
                  height: 61.h,
                  width: 61.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.grey,
                    image: DecorationImage(
                      image: AssetImage(
                        AppAssetsImages.masterCardImage,
                      ),
                    ),
                  ),
                ),
                AppSize.widgetGap(width: 12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReuseableText(
                      text: 'Master card',
                      textStyle: AppTStyleAndSize.secondTextStyle().copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    ReuseableText(
                      text: '**** **** **** 6789',
                      textStyle: AppTStyleAndSize.thirdTextStyle(),
                    ),
                  ],
                ),
                AppSize.widgetGap(width: 63, height: 0),
                Container(
                  height: 20.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(width: 1.w)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 10.h,
                        width: 10.h,
                        decoration: BoxDecoration(
                          color: index==currentIndex?Colors.black:Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );

}
