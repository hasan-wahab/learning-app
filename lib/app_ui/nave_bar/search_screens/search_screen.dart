import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_routes/app_routes.dart';
import 'package:foodi/app_ui/app_widgets/app_text_field.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';

import '../course_screen/course_widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        AppSize.widgetGap(height: 44),
        Padding(
          padding: AppSize.bodyPadding(horizontal: 20,vertical: 0),
          child: SizedBox(
            height: 44.h,
            width: 375.w,
            child: Row(children: [Icon(Icons.arrow_back)]),
          ),
        ),
        AppSize.widgetGap(height: 24),
        Padding(
          padding: AppSize.bodyPadding(horizontal: 20,vertical: 0),
          child: AppTextField(
            icon: Icon(Icons.tune),
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',
            width: 335,
            height: 48,
          ),
        ),
        AppSize.widgetGap(height: 16,width: 0),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: AppSize.bodyPadding2(left: 20),
              child: categoryRow(catagoryLenght: 7,borderRadius: 8),
            )),
        AppSize.widgetGap(height: 28,width: 0),
        Padding(
          padding: AppSize.bodyPadding(horizontal: 20,vertical: 0),
          child: ReuseableText(text: 'Result',textStyle: AppTStyleAndSize.appBarTStyle(),),
        ),
        AppSize.widgetGap(height: 20,width: 20),
        Container(
          padding: AppSize.bodyPadding(horizontal: 20,vertical: 0),
          height: 400.h,
          width: 375.w,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 3,
            itemBuilder: (context,index) {
              return courseCardList(onTap: (){
           Navigator.pushNamed(context, AppRoutes.detailScreen);
              });
            }
          ),
        ),

      ],
    );
  }
}
