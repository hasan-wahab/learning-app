import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_style/app_size.dart';
import '../../common/app_style/text_style.dart';
import '../../common/images/assets_images.dart';
import '../app_widgets/reuseable_text.dart';

Widget videoPlayerContainer(BuildContext context){
  return   Container(
    color: Color.fromRGBO(31, 31, 57, 0.4),
    height: 300.h,
    width: 375.w,
    child: Column(
      children: [
        AppSize.widgetGap(height: 54.8, width: 0),
        Padding(
          padding: AppSize.bodyPadding2(left: 17),
          child: Row(
            children: [InkWell

              (
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios, color: Colors.white))],
          ),
        ),
        AppSize.widgetGap(height: 48.8, width: 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 56.h,
              width: 56.w,

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssetsImages.pauseButtonImage),
                ),
              ),
            ),
          ],
        ),
        AppSize.widgetGap(height: 30, width: 0),
        SizedBox(
          height: 63.h,
          width: 335.45.w,

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: AppSize.bodyPadding2(right: 2),
                    child: Image.asset(
                      AppAssetsImages.videoFullScreenIcon,
                    ),
                  ),
                ],
              ),
              AppSize.widgetGap(height: 16, width: 0),
              Container(
                height: 2.h,
                width: 335.w,
                color: Colors.orange,
              ),
              AppSize.widgetGap(height: 6, width: 0),
              Row(
                children: [
                  ReuseableText(
                    text: '4:10',
                    textStyle: AppTStyleAndSize.fourthSmallTextStyle()
                        .copyWith(color: Colors.white),
                  ),
                  Spacer(),
                  ReuseableText(
                    text: '6:10',
                    textStyle: AppTStyleAndSize.fourthSmallTextStyle()
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}