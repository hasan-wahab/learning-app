import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSize {
  AppSize._();
  // Body padding for all Screens
  static EdgeInsetsGeometry bodyPadding({
    double horizontal = 20,
    double vertical = 20,
  }) => EdgeInsets.symmetric(horizontal: horizontal.w, vertical: vertical.h);

  static colomnSpacing({double height = 20}) => height.h;
  static rowSpacing({double width = 20}) => width.w;

  static widgetGap({double height = 20, double width = 20}) =>
      SizedBox(height: height.h, width: width.w);
}
