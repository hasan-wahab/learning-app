import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/text_style.dart';

class AppBtn extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final VoidCallback? onTap;
  final double height;
  final double? width;
  final TextStyle? textStyle;

  const AppBtn({
    super.key,
    this.text,
    this.onTap,
    this.height = 50,
    this.width,
    this.icon,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height.h,
        width: width!.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),
          color: AppColors.buttonColor,
        ),
        child: text != null
            ? Text(text!, style: textStyle ?? AppTStyleAndSize.buttonTextStyle())
            : icon,
      ),
    );
  }
}
