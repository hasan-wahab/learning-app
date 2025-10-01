import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/app_ui/payment_method/card_list/card_list_screen/card_list_widget.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';
import '../../../../app_routes/app_routes.dart';
import '../../../app_widgets/app_button.dart';

class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 361.h,
            width: 375.w,
            color: AppColors.courseRowColor2,
            child: Column(
              children: [
                AppSize.widgetGap(height: 61, width: 0),
                Padding(
                  padding: AppSize.bodyPadding2(left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back_ios),
                      ReuseableText(
                        text: 'Payment Method',
                        textStyle: AppTStyleAndSize.secondTextStyle(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 604.h,
              width: 375.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.r),
                  topLeft: Radius.circular(30.r),
                ),
              ),
              child: Padding(
                padding: AppSize.bodyPadding2(right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSize.widgetGap(height: 35.97, width: 0),
                    ReuseableText(
                      text: 'Select payment method',
                      textStyle: AppTStyleAndSize.secondTextStyle(),
                    ),
                    AppSize.widgetGap(height: 4.57, width: 0),
                    ReuseableText(
                      text: 'Secure your payment',
                      textStyle: AppTStyleAndSize.fourthSmallTextStyle(),
                    ),
                    AppSize.widgetGap(height: 38, width: 0),
                    Column(
                      children: List.generate(3, (index) {
                        return paymentCardList(currentIndex:currentIndex,index: index,onTap: (){
                          setState(() {
                            currentIndex=index;
                          });
                        });
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: AppSize.bodyPadding2(right: 24, left: 24),
        height: 98.h,
        child: Row(
          children: [
            AppBtn(
              width: 327,
              text: 'Continue',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.cardDetailScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
