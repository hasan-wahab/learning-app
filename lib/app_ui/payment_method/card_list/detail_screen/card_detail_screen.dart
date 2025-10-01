import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/app_button.dart';
import 'package:foodi/app_ui/app_widgets/app_check_box.dart';
import 'package:foodi/app_ui/app_widgets/app_text_field.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';

import 'card_detail_widget.dart';

class CardDetailScreen extends StatefulWidget {
  const CardDetailScreen({super.key});

  @override
  State<CardDetailScreen> createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends State<CardDetailScreen> {

  @override
  void initState() {
WidgetsBinding.instance.addPostFrameCallback((_){
showModalBottomSheet(context: context, builder: (BuildContext context){
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(


    ),
    height: 572.h, width: 375.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSize.widgetGap(height: 16),
        ReuseableText(
          text: 'Card holder name',
          textStyle: AppTStyleAndSize.fourthSmallTextStyle(),
        ),
        AppTextField(hintText: 'Name on card'),
        AppSize.widgetGap(height: 16),
        ReuseableText(
          text: 'Card number',
          textStyle: AppTStyleAndSize.fourthSmallTextStyle(),
        ),

        AppTextField(hintText: 'Card number'),
        AppSize.widgetGap(height: 16),
        ReuseableText(
          text: 'Expiry date',
          textStyle: AppTStyleAndSize.fourthSmallTextStyle(),
        ),
        AppTextField(hintText: 'Expiry date'),
        AppSize.widgetGap(height: 16),

        ReuseableText(
          text: 'Cvv',
          textStyle: AppTStyleAndSize.fourthSmallTextStyle(),
        ),
        AppTextField(hintText: 'Cvv'),
        AppSize.widgetGap(height: 30),
        AppBtn(width: 335, text: 'Pay Now'),
      ],
    ),
  );
});
});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding:EdgeInsets.zero,
        children: [

          AppSize.widgetGap(height: 61, width: 0),
          Padding(
            padding: AppSize.bodyPadding2(left: 20, right: 20),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios),
                ReuseableText(
                  text: 'Master card',
                  textStyle: AppTStyleAndSize.firstTextStyle().copyWith(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          AppSize.widgetGap(height: 20.h),
          Padding(
            padding: AppSize.bodyPadding2(left: 20, right: 20),
            child: masterCard(),
          ),


        ],
      ),
    );
  }



}
