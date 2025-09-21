import 'package:flutter/material.dart';
import 'package:foodi/app_ui/onboarding_scr/on_boarding_secree2.dart';

import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/app_ui/onboarding_scr/onboarding_widgets.dart';

import 'package:foodi/common/images/assets_images.dart';

class OnBoadingScreen1 extends StatelessWidget {
  const OnBoadingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppSize.widgetGap(height: 112),
            onBoadingImage(
              image: AppAssetsImages.firstImage,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnBoardingSecreen2()),
                );
              },
            ),
            AppSize.widgetGap(height: 38),
            firstText(text: 'Numerous free trial courses'),
            AppSize.widgetGap(height: 6),
            secondText(
              text: 'Free courses for you to find your way to learning',
            ),
            AppSize.widgetGap(height: 62),
            threeDots(),
            AppSize.widgetGap(height: 215),
          ],
        ),
      ),
    );
  }
}
