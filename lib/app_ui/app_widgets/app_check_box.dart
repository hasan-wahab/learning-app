import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';

import '../../common/app_style/app_colors.dart';
import '../../common/app_style/app_size.dart';
import '../../common/app_style/text_style.dart';

class AppCheckBox extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const AppCheckBox({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: onTap,
      child: Row(

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
            child: ReuseableText(
              text:
              text,
              textStyle: AppTStyleAndSize.fourthSmallTextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
