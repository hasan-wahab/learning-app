import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';
import 'package:foodi/common/images/assets_images.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;
  bool isShowImage = true;

  pageControllerFunc() {
    pageController.animateToPage(
      currentIndex,
      duration: (Duration(milliseconds: 200)),
      curve: Curves.easeIn,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: AppSize.bodyPadding(horizontal: 20, vertical: 0),
      children: [
        AppSize.widgetGap(height: 61, width: 0),
        ReuseableText(
          text: 'Notification',
          textStyle: AppTStyleAndSize.appBarTStyle().copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppSize.widgetGap(height: 15, width: 0),
        Row(
          spacing: AppSize.rowSpacing(width: 62),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  if (currentIndex == 0) return;
                  if (currentIndex > 0) {
                    currentIndex = 0;
                  }
                });

                pageControllerFunc();
              },
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                        width: 69.w,
                        child: ReuseableText(
                          text: 'message',
                          textStyle: AppTStyleAndSize.fourthSmallTextStyle()
                              .copyWith(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      AppSize.widgetGap(height: 6, width: 0),

                      Container(
                        height: 2.h,
                        width: 42.w,
                        color: currentIndex == 0 ? AppColors.buttonColor : null,
                      ),
                    ],
                  ),
                  Container(
                    height: 6.h,
                    width: 6.w,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (currentIndex == 1) return;
                  if (currentIndex == 0) {
                    currentIndex = 1;
                  }
                });

                pageControllerFunc();
              },
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                        width: 91.4,
                        child: ReuseableText(
                          text: 'notifications',
                          textStyle: AppTStyleAndSize.fourthSmallTextStyle()
                              .copyWith(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      AppSize.widgetGap(height: 6, width: 0),

                      Container(
                        height: 2.h,
                        width: 42.w,
                        color: currentIndex != 0 ? AppColors.buttonColor : null,
                      ),
                    ],
                  ),
                  Container(
                    height: 6.h,
                    width: 6.w,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        AppSize.widgetGap(height: 16, width: 0),
        SizedBox(
          height: 560.h,
          child: PageView(
            onPageChanged: (value) {
              currentIndex = value;
              setState(() {});
            },
            controller: pageController,
            children: [
              ListView.builder(
                padding: EdgeInsets.zero,

                itemBuilder: (BuildContext context, index) {
                  return Container(
                    margin: AppSize.bodyPadding2(bottom: 10),
                    height: isShowImage == true ? 293.h : 136.h,
                    width: 335.w,
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: AppSize.bodyPadding(
                          horizontal: 20,
                          vertical: 19,
                        ),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 48.h,
                              width: 295.72.w,

                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 48.h,
                                    width: 48.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.courseCardColor1,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ),
                                  AppSize.widgetGap(width: 12, height: 0),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ReuseableText(
                                              text: 'Bert Pullman',
                                              textStyle:
                                                  AppTStyleAndSize.fourthSmallTextStyle()
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                            ),
                                            ReuseableText(
                                              text: 'OnLine',
                                              textStyle:
                                                  AppTStyleAndSize.fourthSmallTextStyle()
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ],
                                        ),

                                        ReuseableText(
                                          text: '04:32 PM',
                                          textStyle:
                                              AppTStyleAndSize.fourthSmallTextStyle(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AppSize.widgetGap(height: 13, width: 0),
                            SizedBox(
                              height: 36.h,
                              width: 290.w,

                              child: ReuseableText(
                                overflow: TextOverflow.ellipsis,
                                text:
                                    'Your course has been updated, you can check the new course in your study course.',
                                maxLine: 2,
                                textStyle:
                                    AppTStyleAndSize.fourthSmallTextStyle(),
                              ),
                            ),
                            AppSize.widgetGap(
                              height: isShowImage == true ? 11 : 0,
                              width: 0,
                            ),

                            isShowImage == true
                                ? Container(
                                    height: 145.h,
                                    width: 295.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.courseRowColor2,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: Center(
                                      child: ReuseableText(
                                        text: 'Course Image',
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 3,
              ),
              ListView.builder(
                padding: EdgeInsets.zero,

                itemBuilder: (BuildContext context, index) {
                  return Container(
                    margin: AppSize.bodyPadding2(bottom: 16),
                    height: 80.h,
                    width: 335.w,
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: AppSize.bodyPadding(horizontal: 20,vertical: 16),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 48.h,
                              width: 48.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: AppColors.courseCardColor2,
                              ),
                              child: Image.asset(AppAssetsImages.message2),
                            ),
                            AppSize.widgetGap(width: 16, height: 0),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReuseableText(
                                  text: 'Successful purchase!',
                                  textStyle: AppTStyleAndSize.fourthSmallTextStyle()
                                      .copyWith(color: Colors.black),
                                ),
                                Row(
                                  children: [
                                    Icon(CupertinoIcons.clock_fill,color: AppColors.checkBoxBorderColor,size: 15.w,),
                                    AppSize.widgetGap(width: 4,height: 0),
                                    ReuseableText(
                                      text: 'Just now',
                                      textStyle: AppTStyleAndSize.fourthSmallTextStyle()

                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
