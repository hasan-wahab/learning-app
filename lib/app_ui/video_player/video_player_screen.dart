import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_routes/app_routes.dart';
import 'package:foodi/app_ui/app_widgets/app_button.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/app_ui/datail_screen/detail_widget.dart';
import 'package:foodi/app_ui/video_player/video_player_widget.dart';
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
      body: Stack(
        children: [
          // Image container
          Container(
            height: 300.h,
            width: 375.w,

            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 231, 238, 100),
              image: DecorationImage(
                image: AssetImage(AppAssetsImages.speakingImage),
              ),
            ),
          ),
        videoPlayerContainer(context),
          detailContainer(),
        ],
      ),

      bottomSheet: Container(
        padding: AppSize.bodyPadding2(right: 16, left: 20),
        height: 98.h,

        child: Row(
          children: [
            Container(
              height: 50.h,
              width: 89.w,
              decoration: BoxDecoration(
                color: AppColors.courseRowColor2,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Image.asset(AppAssetsImages.star),
            ),
            AppSize.widgetGap(width: 14, height: 0),
            AppBtn(width: 236, text: 'Buy Now',onTap: (){
              Navigator.pushNamed(context, AppRoutes.paymentCardList);
            },),
          ],
        ),
      ),
    );
  }
}
