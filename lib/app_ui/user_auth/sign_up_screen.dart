import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/app_button.dart';
import 'package:foodi/app_ui/app_widgets/app_text_button.dart';
import 'package:foodi/app_ui/app_widgets/app_text_field.dart';
import 'package:foodi/app_ui/user_auth/login_screen.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        padding: AppSize.bodyPadding(horizontal: 24, vertical: 0),
        children: [
          AppSize.widgetGap(height: 86),
          Text('Sign Up', style: AppTStyleAndSize.firstTextStyle()),

          Text(
            'Enter your details below & free sign up',
            style: AppTStyleAndSize.fourthSmallTextStyle(),
          ),
          AppSize.widgetGap(height: 43),
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
          AppSize.widgetGap(height: 24),
          AppBtn(width: 327, height: 50, text: 'Create account'),
          AppSize.widgetGap(height: 17),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 16.h,
                width: 16.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.5.r),
                  border: Border.all(
                    width: 1.w,
                    color: AppColors.checkBoxBorderColor,
                  ),
                ),
              ),
              AppSize.widgetGap(width: 7.5),
              SizedBox(
                width: 253.w,
                height: 36.h,
                child: Text(
                  'By creating an account you have to agreewith our them & condication.',
                  style: AppTStyleAndSize.fourthSmallTextStyle(),
                ),
              ),
            ],
          ),
          AppSize.widgetGap(height: 25),
          SizedBox(
            width: 202.w,
            height: 18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account？',
                  style: AppTStyleAndSize.fourthSmallTextStyle(),
                ),
                AppTextButton(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                }, text: 'Log In'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
