import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/app_button.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/app_ui/datail_screen/detail_widget.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';
import 'package:foodi/common/images/assets_images.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      bottomSheet: Container(
        padding: AppSize.bodyPadding2(right: 16,left: 20),
        height: 98.h,color: Colors.amber,
        child: Row(
          children: [
            Container(

              height: 50.h,
              width: 89.w,
              decoration: BoxDecoration(
                  color: AppColors.courseRowColor2,
                  borderRadius: BorderRadius.circular(12.r)
              ),
              child:   Image.asset(AppAssetsImages.star),
            ),
            AppSize.widgetGap(width: 14,height: 0),
            AppBtn(width: 236,text: 'Buy Now',),
          ],
        ),
      ),
    );
  }
}

