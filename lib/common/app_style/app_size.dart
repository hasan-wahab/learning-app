import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSize {
  AppSize._();
  // Body padding for all Screens
  static EdgeInsetsGeometry bodyPadding({
    double horizontal = 0,
    double vertical = 0,
  }) => EdgeInsets.symmetric(horizontal: horizontal.w, vertical: vertical.h);
  static EdgeInsetsGeometry bodyPadding2({
    double top = 0,
    double bottom = 0,
    double right=0,
    double left=0,
  }) => EdgeInsets.only(top: top.h,bottom: bottom.h,left: left.w,right: right.w);

  static colomnSpacing({double height = 20}) => height.h;
  static rowSpacing({double width = 20}) => width.w;

  static widgetGap({double height = 20, double width = 20}) =>
      SizedBox(height: height.h, width: width.w);
}
