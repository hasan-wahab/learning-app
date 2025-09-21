import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/nave_bar/course_screen.dart';
import 'package:foodi/app_ui/nave_bar/home_screen/home_screen.dart';
import 'package:foodi/app_ui/nave_bar/message_screen.dart';
import 'package:foodi/app_ui/nave_bar/profile_screen.dart';
import 'package:foodi/app_ui/nave_bar/search_screen.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';
import 'package:foodi/common/images/assets_images.dart';

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
  List<Widget> screenList = [
    HomeScreen(),
    CourseScreen(),
    SearchScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(currentValue),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
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
                            onTap: () {
                              setState(() {
                                currentValue = index;
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
                                Text(
                                  textList[index],
                                  style: AppTStyleAndSize.naveBarTStyle()
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
      ),
    );
  }
}
