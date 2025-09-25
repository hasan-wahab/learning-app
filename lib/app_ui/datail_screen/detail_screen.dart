import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_routes/app_routes.dart';
import 'package:foodi/app_ui/app_widgets/app_button.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/app_ui/datail_screen/detail_widget.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';
import 'package:foodi/common/images/assets_images.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Container(
            padding: AppSize.bodyPadding2(left: 20, right: 20),
            height: 405.h,
            width: 375.w,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 231, 238, 100),
              image: DecorationImage(
                image: AssetImage(AppAssetsImages.speakingImage),
                alignment: Alignment.centerRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSize.widgetGap(height: 44, width: 0),
                SizedBox(
                  height: 44.h,
                  width: 375,
                  child: Row(children: [Icon(Icons.arrow_back_ios)]),
                ),
                AppSize.widgetGap(height: 20, width: 0),
                ClipPath(
                  clipper: ArowShape(),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.amber),
                    height: 26.w,
                    width: 95.65.w,
                    child: ReuseableText(
                      text: 'BESTSELLER',
                      textStyle: AppTStyleAndSize.fourthSmallTextStyle()
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ),
                AppSize.widgetGap(height: 16, width: 0),
                ReuseableText(
                  text: 'Product Design V1.0',
                  textStyle: AppTStyleAndSize.secondTextStyle(),
                ),
              ],
            ),
          ),
        detailContainer()
        ],
      ),

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
            AppBtn(width: 236,text: 'Buy Now',onTap: (){
              Navigator.pushNamed(context, AppRoutes.videoPlayerScreen);
            },),
          ],
        ),
      ),
    );
  }
}

class ArowShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width - 10, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 10, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
