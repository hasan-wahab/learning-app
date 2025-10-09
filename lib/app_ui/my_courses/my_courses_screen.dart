import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/app_ui/nave_bar/home_screen/home_screen_widgets.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';
import 'package:foodi/common/images/assets_images.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
        children: [
          AppSize.widgetGap(height: 59, width: 0),
          Row(
            spacing: AppSize.rowSpacing(width: 98.38),
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                  child: Icon(Icons.arrow_back_ios)),
              ReuseableText(
                text: 'My Courses',
                textStyle: AppTStyleAndSize.thirdTextStyle().copyWith(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          AppSize.widgetGap(height: 12, width: 0),
          timerWidget(),
          AppSize.widgetGap(height: 20, width: 0),
          Wrap(
            runSpacing: AppSize.colomnSpacing(height: 16),
            spacing: AppSize.rowSpacing(width: 14),
            children: List.generate((3), (index) {
              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    padding: AppSize.bodyPadding2(left: 19, right: 11),
                    height: 182.69.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      color: AppColors.courseCardColor1,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      children: [
                        AppSize.widgetGap(height: 25),
                        ClipRRect(
                          child: SizedBox(
                            height: 48.h,
                            child: ReuseableText(
                              text: 'Product Design v1.0',
                              textStyle: AppTStyleAndSize.secondTextStyle()
                                  .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        AppSize.widgetGap(height: 22.46),

                        Row(
                          children: [
                            Container(
                              width: 122.w,
                              height: 6.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.r),
                                  bottomLeft: Radius.circular(12.r),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(57, 138, 128, 100),
                                    Color.fromRGBO(57, 138, 128, 100),
                                    Colors.white,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        AppSize.widgetGap(height: 8.54),

                        Row(
                          children: [
                            Column(
                              children: [
                                ReuseableText(text: 'Completed'),
                                ReuseableText(
                                  text: '14/18',
                                  textStyle: AppTStyleAndSize.secondTextStyle()
                                      .copyWith(fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: AppSize.bodyPadding2(bottom: 11.2, right: 11),
                    child: SizedBox(
                      height: 44.h,
                      width: 44.w,
                      child: Image.asset(AppAssetsImages.play),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
