import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/app_app_bar.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/app_ui/nave_bar/course_screen/course_screen.dart';
import 'package:foodi/app_ui/nave_bar/home_screen/home_screen.dart';
import 'package:foodi/app_ui/nave_bar/message_screen/message_screen.dart';
import 'package:foodi/app_ui/nave_bar/profile_screen/profile_screen.dart';
import 'package:foodi/app_ui/nave_bar/search_screens/search_screen.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';
import 'package:foodi/common/images/assets_images.dart';
import 'package:foodi/local_storage_service/local_data/local_data.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentValue = 0;
  List iconList = [
    Icons.home,
    Icons.filter_1_rounded,
    Icons.search,
    Icons.message,
    Icons.person,
  ];
  List<String> textList = ['Home', 'Course', 'Search', 'Message', 'Profile'];

  List<ScrollController> controllerList = List.generate(5, (index) {
    return ScrollController();
  });

  List<bool> showAppBar = [false, false, false, false, false];

  @override
  void dispose() {
    controllerList[currentValue].dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = controllerList[currentValue];
    controller.addListener(() {
      if (controller.position.pixels > 38.0) {
        setState(() {
          showAppBar[currentValue] = true;
        });
      } else {
        setState(() {
          showAppBar[currentValue] = false;
        });
      }
    });
    final List<Widget> screenList = [
      HomeScreen(
        controller: controllerList[currentValue],
        showAppBar: showAppBar[currentValue],
      ),
      CourseScreen(
        controller: controllerList[currentValue],
        showAppBar: showAppBar[currentValue],
      ),
      SearchScreen(),
      MessageScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      appBar: showAppBar[currentValue] == true
          ? AppAppBar(
              title: currentValue == 0 ? 'Hi,Hasan' : textList[currentValue],
              actionWidget: currentValue == 0
                  ? SizedBox(
                      height: 49.98.h,
                      width: 36.w,
                      child: Stack(
                        children: [
                          Container(
                            height: 36.h,
                            width: 36.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.courseCardColor1,
                            ),
                          ),

                          SizedBox(
                            height: 40.h,
                            width: 36.w,
                            child: Image.asset(AppAssetsImages.avatar),
                          ),
                        ],
                      ),
                    )
                  : null,
            )
          : null,
      body: screenList.elementAt(currentValue),
      backgroundColor: Colors.white,
      bottomNavigationBar: SizedBox(
        height: 111.h,
        width: 375.w,
        child: Stack(
          children: [
            // Second Container
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 96.h,
                width: 375.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 14.63.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate((textList.length), (index) {
                      return SizedBox(
                        width: 52.w,
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              currentValue = index;
                              // jab tak scrollController =0 tab k koi appbar show nahi hoga
                              if (currentValue != index) {
                                showAppBar[index] = true;
                              } else {
                                showAppBar[index] = false;
                                print(currentValue);
                              }
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            // Icons And Text Colum Home
                            children: [
                              SizedBox(
                                child: index != 2
                                    ? Icon(
                                        iconList[index],
                                        color: index == currentValue
                                            ? AppColors.buttonColor
                                            : null,
                                      )
                                    : Icon(Icons.add, color: Colors.white),
                              ),
                              AppSize.widgetGap(height: 12.63.h),
                              ReuseableText(
                                text: textList[index],
                                textStyle: AppTStyleAndSize.naveBarTStyle()
                                    .copyWith(
                                      color: currentValue == index
                                          ? AppColors.buttonColor
                                          : Colors.black,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentValue = 2;
                        });
                      },
                      child: Container(
                        height: 52.h,
                        width: 52,
                        decoration: BoxDecoration(
                          color: AppColors.navBarCircleColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          iconList[2],
                          color: currentValue == 2
                              ? AppColors.buttonColor
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
