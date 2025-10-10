import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/app_button.dart';
import 'package:foodi/app_ui/app_widgets/app_text_button.dart';
import 'package:foodi/app_ui/app_widgets/app_text_field.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/app_ui/user_auth/continue_with_phone/continue_with_phone_screen.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';
import 'package:foodi/common/images/assets_images.dart';

import '../../../app_routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ScrollController scrollController = ScrollController();
  bool showAppBar = false;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels > 38) {
        setState(() {
          showAppBar = true;
        });
      } else {
        setState(() {
          showAppBar = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ? AppBar(
        toolbarHeight: 66.h,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,

        title: ReuseableText(
          text: 'Log In',
          textStyle: AppTStyleAndSize.secondTextStyle(),
        ),
      ) : null,
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        controller: scrollController,
        padding: AppSize.bodyPadding(horizontal: 24, vertical: 0),
        children: [
          AppSize.widgetGap(height:showAppBar!=true? 86:0),
         showAppBar!=true? ReuseableText(
            text: 'Log In',
            textStyle: AppTStyleAndSize.firstTextStyle(),
          ):Container(),
          AppSize.widgetGap(height: 57),
          ReuseableText(
            text: 'Your email',
            textStyle: AppTStyleAndSize.fourthSmallTextStyle().copyWith(
              fontSize: 14.sp,
            ),
          ),
          // Text Field
          AppTextField(hintText: 'Enter your email'),
          AppSize.widgetGap(height: 24),
          ReuseableText(
            text: 'Your password',
            textStyle: AppTStyleAndSize.fourthSmallTextStyle().copyWith(
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
              ReuseableText(
                text: 'Forget password ?',
                textStyle: AppTStyleAndSize.fourthSmallTextStyle().copyWith(
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
              Navigator.pushReplacementNamed(context, AppRoutes.naveBar);
            },
          ),
          AppSize.widgetGap(height: 26),

          SizedBox(
            width: 202.w,
            height: 18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReuseableText(
                  text: 'Don’t have an account? ',
                  textStyle: AppTStyleAndSize.fourthSmallTextStyle(),
                ),
                AppTextButton(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.signUpScreen);
                  },
                  text: 'Sign Up',
                ),
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
              ReuseableText(
                text: 'OR login with',
                textStyle: AppTStyleAndSize.fourthSmallTextStyle(),
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
