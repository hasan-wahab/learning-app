import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/app_button.dart';
import 'package:foodi/app_ui/app_widgets/app_text_field.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/app_ui/nave_bar/nav_bar.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';
import 'package:foodi/common/images/assets_images.dart';

import '../../../app_routes/app_routes.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
                Icon(Icons.cancel_outlined),
                AppSize.widgetGap(width: 96.75),
                ReuseableText(text: 'Verify Phone', textStyle: AppTStyleAndSize.appBarTStyle()),
              ],
            ),
          ),
          AppSize.widgetGap(width: 68),
          SizedBox(
            width: 259.w,
            height: 27.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReuseableText(
                text:   'Code is sent to 098765432',
                  textStyle: AppTStyleAndSize.appBarTStyle().copyWith(
                    color: Color.fromRGBO(133, 133, 151, 100),
                  ),
                ),
              ],
            ),
          ),
          AppSize.widgetGap(width: 17),
          Row(
            spacing: AppSize.rowSpacing(width: 19),
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate((4), (index) {
              return SizedBox(height: 58.h, width: 50.w, child: AppTextField());
            }),
          ),

          AppSize.widgetGap(height: 86),
          AppBtn(
            width: 253,
            text: 'Verify and Create account',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Material(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 301.h,
                          width: 291.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Column(
                            children: [
                              AppSize.widgetGap(height: 48),
                              SizedBox(
                                height: 64.h,
                                width: 64.w,
                                child: Image.asset(AppAssetsImages.popUpImage),
                              ),
                              AppSize.widgetGap(height: 19),
                              ReuseableText(
                              text:   'Success',
                                textStyle: AppTStyleAndSize.buttonTextStyle()
                                    .copyWith(color: Colors.black),
                              ),
                              AppSize.widgetGap(height: 9),
                              SizedBox(
                                width: 172.w,
                                height: 36.h,
                                child: ReuseableText(
                              text:     'Congratulations, you have completed your registration!',
                                  textStyle:
                                      AppTStyleAndSize.fourthSmallTextStyle(),
                                ),
                              ),
                              AppSize.widgetGap(height: 15),
                              AppBtn(
                                width: 259,
                                text: 'Done',
                                onTap: () {
                                  Navigator.pushNamed(context, AppRoutes.naveBar);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          AppSize.widgetGap(height: 68),
        ],
      ),
    );
  }
}
