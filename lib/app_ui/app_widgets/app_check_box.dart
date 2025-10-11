import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_states.dart';

import '../../common/app_style/app_colors.dart';
import '../../common/app_style/app_size.dart';
import '../../common/app_style/text_style.dart';

class AppCheckBox extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final SignUpStates state;

  const AppCheckBox({super.key, required this.text, required this.onTap,required this.state});


  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: onTap,
      child: Row(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: 16.h,
            width: 16.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.5.r),
              border: Border.all(
                width: 1.w,
                color: AppColors.checkBoxBorderColor,
              ),
            ),
            child:state.isAgree==false?null: Icon(CupertinoIcons.checkmark_alt,size: 17,fontWeight: FontWeight.bold,),
          ),
          AppSize.widgetGap(width: 7.5),
          SizedBox(
            width: 253.w,
            height: 36.h,
            child: ReuseableText(
              text:
              text,
              textStyle: AppTStyleAndSize.fourthSmallTextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
