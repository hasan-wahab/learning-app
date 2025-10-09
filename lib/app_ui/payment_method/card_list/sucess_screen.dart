import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_routes/app_routes.dart';
import 'package:foodi/app_ui/app_widgets/app_button.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/images/assets_images.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(

          spacing: AppSize.colomnSpacing(height: 20),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(AppAssetsImages.successIcon)  ,
            ReuseableText(text: 'Successful purchase!'),
            AppSize.widgetGap(height: 5,width: 0),
            AppBtn(width: 375,text: 'Start Learning',onTap: (){
              Navigator.pushNamed(context, AppRoutes.myCoursesScreen);
            },),
          ],
        ),
      ),
    );
  }
}
