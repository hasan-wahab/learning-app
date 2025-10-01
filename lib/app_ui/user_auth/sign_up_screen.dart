import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/app_button.dart';
import 'package:foodi/app_ui/app_widgets/app_check_box.dart';
import 'package:foodi/app_ui/app_widgets/app_text_button.dart';
import 'package:foodi/app_ui/app_widgets/app_text_field.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/app_ui/user_auth/login_screen.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';

import '../../app_routes/app_routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
      appBar: showAppBar
          ? AppBar(
              toolbarHeight: 66.h,
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,

              title: ReuseableText(
                text: 'Sign Up',
                textStyle: AppTStyleAndSize.secondTextStyle(),
              ),
            )
          : null,
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        controller: scrollController,
        padding: AppSize.bodyPadding(horizontal: 24, vertical: 0),
        children: [
          AppSize.widgetGap(height: showAppBar != true ? 86 : 0),
          showAppBar != true
              ? ReuseableText(
                  text: 'SignUp',
                  textStyle: AppTStyleAndSize.firstTextStyle(),
                )
              : Container(),

          showAppBar != true
              ? ReuseableText(
                  text: 'Enter your details below & free sign up',
                  textStyle: AppTStyleAndSize.fourthSmallTextStyle(),
                )
              : Container(),
          AppSize.widgetGap(height: 43),
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
          AppSize.widgetGap(height: 24),
          AppBtn(
            width: 327,
            height: 50,
            text: 'Create account',
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.naveBar);
            },
          ),
          AppSize.widgetGap(height: 17),
          AppCheckBox(text: 'By creating an account you have to agree with our terms & condition.',onTap: (){},),
          AppSize.widgetGap(height: 25),
          SizedBox(
            width: 202.w,
            height: 18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReuseableText(
                  text: 'Already have an account？',
                  textStyle: AppTStyleAndSize.fourthSmallTextStyle(),
                ),
                AppTextButton(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.loginScreen,
                    );
                  },
                  text: 'Log In',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
