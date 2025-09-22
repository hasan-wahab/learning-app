import 'package:flutter/material.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/text_style.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const AppTextButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ReuseableText(
        text: text,
        textStyle: AppTStyleAndSize.fourthSmallTextStyle().copyWith(
          color: AppColors.buttonColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
