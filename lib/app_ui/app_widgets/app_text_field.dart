import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final Widget? icon;
  final Widget? prefixIcon;
  final double height;
  final double width;
  String Function(String? value)? validator;
  TextEditingController? controller = TextEditingController();
  void Function(String value)? onChange;
   bool obscureText;
  AppTextField({
    super.key,
    this.icon,
    this.hintText,
    this.height = 50,
    this.width = 327,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.onChange,
    this.obscureText=false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
      child: TextFormField(
        obscureText: obscureText,
        onChanged: (value)=>onChange!(value),
        validator: (value) => validator!(value),
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,

          hintText: hintText,
          suffixIcon: icon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
        ),
      ),
    );
  }
}
