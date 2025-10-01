import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_style/app_size.dart';
import '../../../../common/app_style/text_style.dart';
import '../../../../common/images/assets_images.dart';
import '../../../app_widgets/reuseable_text.dart';

Widget masterCard(){
  return Container(
    height: 216.h,
    width: 344.w,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSize.widgetGap(height: 34, width: 0),
        Padding(
          padding: AppSize.bodyPadding2(left: 24),
          child: SizedBox(
            height: 24.h,
            width: 32.w,
            child: Image.asset(AppAssetsImages.chip),
          ),
        ),
        AppSize.widgetGap(height: 29, width: 0),
        Padding(
          padding: AppSize.bodyPadding2(left: 20),
          child: ReuseableText(
            text: '* * * *  * * * *  * * * *  3947',
            textStyle: AppTStyleAndSize.secondTextStyle().copyWith(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        AppSize.widgetGap(height: 43,width: 0),
        Padding(
          padding: AppSize.bodyPadding2(left: 20,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ReuseableText(
                    text: 'Card Holder Name',
                    textStyle: AppTStyleAndSize.thirdTextStyle().copyWith(
                      fontSize: 10,
                    )
                        .copyWith(color: Colors.white),
                  ),
                  ReuseableText(
                    text: 'Hasan Wahab',
                    textStyle: AppTStyleAndSize.thirdTextStyle().copyWith(
                      fontSize: 14,
                    )
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  ReuseableText(
                    text: 'Expiry Date',
                    textStyle: AppTStyleAndSize.thirdTextStyle().copyWith(
                      fontSize: 10,
                    )
                        .copyWith(color: Colors.white),
                  ),
                  ReuseableText(
                    text: '5/27',
                    textStyle: AppTStyleAndSize.thirdTextStyle().copyWith(
                      fontSize: 14,
                    )
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              Image.asset(AppAssetsImages.masterCardImage)
            ],
          ),
        ),
      ],
    ),
  );
}

