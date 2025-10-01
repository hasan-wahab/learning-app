import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/app_style/app_colors.dart';
import '../../../common/app_style/app_size.dart';
import '../../../common/app_style/text_style.dart';
import '../../../common/images/assets_images.dart';
import '../../app_widgets/reuseable_text.dart';

Widget firstRowTitleAndAvatar(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ReuseableText(
        text: 'Course',
        textStyle: AppTStyleAndSize.firstTextStyle(),
      ),
      // SizedBox(
      //   height: 49.98.h,
      //   width: 36.w,
      //   child: Stack(
      //     children: [
      //       Container(
      //         height: 36.h,
      //         width: 36.w,
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           color:Color.fromRGBO(255, 235, 240, 100),
      //         ),
      //       ),
      //
      //       SizedBox(
      //         height: 40.h,
      //         width: 36.w,
      //         child: Image.asset(AppAssetsImages.avatar),
      //       ),
      //     ],
      //   ),
      // ),

    ],
  );
}

Widget secondRowTwoCards(){
  return     SizedBox(
    height: 108.h,
    width: 335.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        SizedBox(
          height: 110.h,
          width: 160.w,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: AppSize.bodyPadding2(bottom: 8.92),
                  height: 77.46.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                    color: AppColors.courseRowColor2,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: 110.h,
                  width: 109.75.w,
                  child: Image.asset(AppAssetsImages.courseImage2),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: AppSize.bodyPadding2(bottom: 8.9),
                  height: 24.13.h,
                  width: 81.79.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    ),
                  ),
                  child: Center(child: ReuseableText(text: 'Language', textStyle: AppTStyleAndSize.tFieldTextStyle()
                      .copyWith(color: AppColors.buttonColor),)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 110.h,
          width: 160.w,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: AppSize.bodyPadding2(bottom: 8.92),
                  height: 77.46.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                    color: AppColors.courseRowColor1,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: 110.h,
                  width: 109.75.w,
                  child: Image.asset(AppAssetsImages.courseImage1),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: AppSize.bodyPadding2(bottom: 8.9),
                  height: 24.13.h,
                  width: 81.79.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: ReuseableText(
                      text: 'Painting',
                      textStyle: AppTStyleAndSize.tFieldTextStyle()
                          .copyWith(color: AppColors.buttonColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
Widget categoryRow({required int catagoryLenght,double borderRadius=12}){
  return  Row(
      children: List.generate((catagoryLenght), (index){
        return Container(
          margin: AppSize.bodyPadding2(right: 17),
          height: 28.h,
          width: 73.w,
          decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
          child: Center(
            child: ReuseableText(
              text: 'All',
              textStyle: AppTStyleAndSize.thirdTextStyle().copyWith(
                color: Colors.white,
              ),
            ),
          ),
        );
      })
  );
}
Widget courseCardList({VoidCallback? onTap}){
 return InkWell(
   onTap: onTap,
   child: SizedBox(
      height: 100.h,
      width: 335.w,
      child: Card(
        child: Padding(
          padding:AppSize.bodyPadding(horizontal: 10,vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

                height: 68.h,
                width: 68.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.green,
                ),
              ),
              AppSize.widgetGap(width: 35,height: 0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 21.h,
                    width: 136.w,
                    child: ReuseableText(text: 'Product Design',overflow:TextOverflow.fade,textStyle: AppTStyleAndSize.secondTextStyle().copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                  SizedBox(

                    height:18.h ,
                    width: 130.w,
                    child: Row(
                      spacing: AppSize.rowSpacing(width: 10),
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        ReuseableText(text: 'Roberston Connnie',overflow:TextOverflow.fade,textStyle: AppTStyleAndSize.fourthSmallTextStyle(),),
                      ],
                    ),
                  ),
                  AppSize.widgetGap(height: 7),
                  SizedBox(
                    height:24.h ,
                    width: 101.w,
                    child: Row(
                      spacing: AppSize.rowSpacing(width: 6),
                      children: [
                        ReuseableText(text: '\$199',overflow:TextOverflow.fade,textStyle: AppTStyleAndSize.secondTextStyle().copyWith(
                            fontSize: 16,
                            color: AppColors.buttonColor,
                            fontWeight: FontWeight.bold
                        ),),
                        Container(
                          height: 16.h,
                          width: 57.w,
                          decoration: BoxDecoration(
                            color: AppColors.courseRowColor1,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Center(
                            child: ReuseableText(text: '16 hours',overflow:TextOverflow.fade,textStyle: AppTStyleAndSize.secondTextStyle().copyWith(
                                color: Colors.orange,
                                fontSize: 10
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    ),
 );
}