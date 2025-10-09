import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/app_ui/nave_bar/home_screen/home_screen_widgets.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';

import '../../common/app_style/app_colors.dart';
import '../../common/images/assets_images.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? actionWidget;
  bool profileImage;

   AppAppBar({super.key,this.title='', this.actionWidget,this.profileImage=true});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.buttonColor,
      padding: AppSize.bodyPadding2(left: 20, right: 20),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReuseableText(
                  text: title,
                  textStyle: AppTStyleAndSize.firstTextStyle().copyWith(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
               actionWidget==null?Container():actionWidget!,
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(55.0.h);
}
