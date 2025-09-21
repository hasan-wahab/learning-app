import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/app_button.dart';
import 'package:foodi/app_ui/app_widgets/app_text_button.dart';
import 'package:foodi/app_ui/app_widgets/app_text_field.dart';
import 'package:foodi/app_ui/user_auth/continue_with_phone_screen.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';
import 'package:foodi/common/images/assets_images.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        padding: AppSize.bodyPadding(horizontal: 24, vertical: 0),
        children: [
          AppSize.widgetGap(height: 86),
          Text('Log In', style: AppTStyleAndSize.firstTextStyle()),
          AppSize.widgetGap(height: 57),
          Text(
            'Your email',
            style: AppTStyleAndSize.fourthSmallTextStyle().copyWith(
              fontSize: 14.sp,
            ),
          ),
          // Text Field
          AppTextField(hintText: 'Enter your email'),
          AppSize.widgetGap(height: 24),
          Text(
            'Your password',
            style: AppTStyleAndSize.fourthSmallTextStyle().copyWith(
              fontSize: 14.sp,
            ),
          ),
          AppTextField(
            icon: Icon(Icons.remove_red_eye_rounded),
            hintText: 'Enter your Password',
          ),
          AppSize.widgetGap(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Forget password ?',
                style: AppTStyleAndSize.fourthSmallTextStyle().copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          AppSize.widgetGap(height: 13),
          AppBtn(
            width: 327,
            height: 50,
            text: 'Log In',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContinueWithPhoneScreen(),
                ),
              );
            },
          ),
          AppSize.widgetGap(height: 26),

          SizedBox(
            width: 202.w,
            height: 18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account? ',
                  style: AppTStyleAndSize.fourthSmallTextStyle(),
                ),
                AppTextButton(onTap: () {}, text: 'Sign Up'),
              ],
            ),
          ),
          AppSize.widgetGap(height: 23),
          Row(
            children: [
              Container(
                height: 1.h,
                width: 103.5.w,
                color: AppColors.checkBoxBorderColor,
              ),
              AppSize.widgetGap(width: 22.73),
              Text(
                'OR login with',
                style: AppTStyleAndSize.fourthSmallTextStyle(),
              ),
              AppSize.widgetGap(width: 22.73),
              Container(
                height: 1.h,
                width: 103.5.w,
                color: AppColors.checkBoxBorderColor,
              ),
            ],
          ),
          AppSize.widgetGap(height: 21),
          SizedBox(
            height: 48.h,
            width: 122.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 48.h,
                  width: 48.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 34.01.h,
                        width: 34.w,
                        child: Image(
                          image: AssetImage(AppAssetsImages.googleImage),
                        ),
                      ),
                    ],
                  ),
                ),
                AppSize.widgetGap(width: 38.w),
                SizedBox(
                  height: 48.h,
                  width: 48.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 34.01.h,
                        width: 34.w,
                        child: Image(
                          image: AssetImage(AppAssetsImages.facbookImage),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
