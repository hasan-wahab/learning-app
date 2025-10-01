import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/text_style.dart';

class AppBtn extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final VoidCallback? onTap;
  final double height;
  final double? width;
  final TextStyle? textStyle;
  final double borderRadius;
  final bool isColor;

  const AppBtn({
    super.key,
    this.text,
    this.onTap,
    this.height = 50,
    this.width,
    this.icon,
    this.textStyle,
    this.borderRadius = 12,
    this.isColor = true,
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
          borderRadius: BorderRadius.circular(borderRadius.r),
          color: isColor ? AppColors.buttonColor : Colors.white,
          border: isColor?null:Border.all(color: AppColors.buttonColor)
        ),
        child: text != null
            ? ReuseableText(
                text: text!,
                textStyle: isColor
                    ? textStyle ?? AppTStyleAndSize.buttonTextStyle()
                    : textStyle ??
                          AppTStyleAndSize.buttonTextStyle().copyWith(
                            color: AppColors.buttonColor,
                          ),
              )
            : icon,
      ),
    );
  }
}
