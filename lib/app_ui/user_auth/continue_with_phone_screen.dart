import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/app_button.dart';
import 'package:foodi/app_ui/app_widgets/app_text_field.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/app_ui/user_auth/otp_screen.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';
import 'package:foodi/common/images/assets_images.dart';

import '../../app_routes/app_routes.dart';

class ContinueWithPhoneScreen extends StatelessWidget {
  const ContinueWithPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        padding: AppSize.bodyPadding(horizontal: 24, vertical: 0),
        children: [
          AppSize.widgetGap(height: 44),
          SizedBox(
            height: 44.h,
            width: 375.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.remove_red_eye),
                AppSize.widgetGap(width: 55.5),
                ReuseableText(
                 text:  'Continue with phone',
                  textStyle: AppTStyleAndSize.appBarTStyle(),
                ),
              ],
            ),
          ),
          AppSize.widgetGap(height: 36),
          SizedBox(
            width: 128.98.w,
            height: 128.h,
            child: Image.asset(AppAssetsImages.continuePhoneImage),
          ),
          AppSize.widgetGap(height: 65),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 21.h,
                width: 182.w,
                child: ReuseableText(
               text:    'Enter your phone number',
                  textStyle: AppTStyleAndSize.tFieldTextStyle(),
                ),
              ),
            ],
          ),
          AppSize.widgetGap(height: 23),
          SizedBox(
            height: 50.h,
            width: 327.w,
            child: AppTextField(
              hintText: 'Enter your phone',
              icon: AppBtn(
                width: 124,
                text: 'Continue',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.otpScreen);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
