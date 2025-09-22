import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/app_button.dart';
import 'package:foodi/app_ui/onboarding_scr/onboarding_widgets.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';
import 'package:foodi/common/images/assets_images.dart';

import '../../app_routes/app_routes.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          children: [
            AppSize.widgetGap(height: 112),
            onBoadingImage(image: AppAssetsImages.thirdImage),
            AppSize.widgetGap(height: 38),
            firstText(text: 'Create your own study plan'),
            AppSize.widgetGap(height: 18),
            secondText(
              width: 190,
              height: 72,
              text:
                  'Study according to the study plan, make study more motivated',
            ),
            AppSize.widgetGap(height: 26),

            threeDots(),
            AppSize.widgetGap(height: 81.75),
            SizedBox(
              child: Row(
                spacing: AppSize.rowSpacing(width: 15),
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppBtn(
                    text: 'Sign Up',
                    width: 160,
                    height: 50,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.signUpScreen);
                    },
                  ),
                  AppBtn(text: 'Sign In', width: 160, height: 50, onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
