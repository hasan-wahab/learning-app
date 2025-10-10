import 'package:flutter/material.dart';
import 'package:foodi/app_ui/onboarding_scr/onboarding_screen3.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/app_ui/onboarding_scr/onboarding_widgets.dart';
import 'package:foodi/common/images/assets_images.dart';

import '../../app_routes/app_routes.dart';

class OnBoardingSecreen2 extends StatefulWidget {
  const OnBoardingSecreen2({super.key});

  @override
  State<OnBoardingSecreen2> createState() => _OnBoardingSecreen2State();
}

class _OnBoardingSecreen2State extends State<OnBoardingSecreen2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: Center(
        child: Column(
          children: [
            AppSize.widgetGap(height: 112),
            onBoadingImage(
              image: AppAssetsImages.secondImage,
              onTap: () {

              },
            ),
            AppSize.widgetGap(height: 38),
            firstText(text: 'Quickly and easy learning'),
            AppSize.widgetGap(height: 18),
            secondText(
              width: 203,
              height: 72,
              text:
                  'Easy and fast learning at any time to help you improve various skills',
            ),
            AppSize.widgetGap(height: 70,),


          ],
        ),
      ),
    );
  }
}
