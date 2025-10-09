import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/app_text_field.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';

import 'course_widgets.dart';

class CourseScreen extends StatelessWidget {

  ScrollController? controller = ScrollController();
  bool showAppBar;

  CourseScreen({super.key,  this.controller,this.showAppBar=false});

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
      children: [
        AppSize.widgetGap(height: 61,  width: 0),
        firstRowTitleAndAvatar(showAppBar:showAppBar ),
        AppSize.widgetGap(height: 15, width: 0),
        AppTextField(
          height: 48,
          width: 335,
          hintText: 'Find course',
          icon: Icon(Icons.add),
          prefixIcon: Icon(Icons.search),
        ),
        secondRowTwoCards(),
        AppSize.widgetGap(height: 36),
        ReuseableText(
          text: 'Choice your course',
          textStyle: AppTStyleAndSize.appBarTStyle(),
          overflow: TextOverflow.fade,
        ),
        AppSize.widgetGap(height: 13, width: 0),
        categoryRow(catagoryLenght: 3),
        AppSize.widgetGap(height: 24, width: 0),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return courseCardList();
          },
        ),
      ],
    );
  }
}
