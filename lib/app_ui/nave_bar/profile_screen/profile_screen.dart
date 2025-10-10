import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/common/app_style/text_style.dart';

import '../../../common/app_style/app_colors.dart';
import '../../../common/app_style/app_size.dart';
import '../../../common/images/assets_images.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});

  List<String> textList=[
    'Favorite',
    'Edit account',
    'Setting and privacy',
    'Help',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSize.bodyPadding(horizontal: 20, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSize.widgetGap(height: 61, width: 0),
          ReuseableText(
            text: 'Account',
            textStyle: AppTStyleAndSize.appBarTStyle().copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          AppSize.widgetGap(height: 23, width: 0),
          // Circle avatar
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 88.h,
                width: 64.w,
                child: Stack(
                  children: [
                    Container(
                      height: 64.h,
                      width: 64.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.courseCardColor1,
                      ),
                    ),

                    SizedBox(
                      height: 88.h,

                      child: Image.asset(AppAssetsImages.avatar),
                    ),

                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 20.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          size: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppSize.widgetGap(height: 12.6,width: 0),
          Column(
            spacing: AppSize.colomnSpacing(height: 30 ),
            children: List.generate((4), (index) {
              return Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReuseableText(
                    text: textList[index],
                    textStyle: AppTStyleAndSize.thirdTextStyle().copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_sharp, size: 14.w),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
