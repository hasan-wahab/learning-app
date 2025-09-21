import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final Widget? icon;
  const AppTextField({super.key, this.icon, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 327.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: icon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
        ),
      ),
    );
  }
}
