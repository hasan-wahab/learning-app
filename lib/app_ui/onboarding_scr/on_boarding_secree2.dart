import 'package:flutter/material.dart';
import 'package:foodi/app_ui/onboarding_scr/onboarding_screen3.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/app_ui/onboarding_scr/onboarding_widgets.dart';
import 'package:foodi/common/images/assets_images.dart';

class OnBoardingSecreen2 extends StatelessWidget {
  const OnBoardingSecreen2({super.key});

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen3()),
                );
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
            AppSize.widgetGap(height: 26),
            threeDots(),
            AppSize.widgetGap(height: 215),
          ],
        ),
      ),
    );
  }
}
