import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';

import 'package:foodi/app_ui/nave_bar/home_screen/home_screen_widgets.dart';

import 'package:foodi/common/app_style/app_size.dart';

class HomeScreen extends StatefulWidget {
  ScrollController? controller = ScrollController();
  HomeScreen({super.key, this.controller});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showAppBar=false;

  // @override
  // void initState() {
  //   final controller=widget.controller;
  //   controller!.addListener((){
  //     if(controller.position.pixels>38){
  //       // show appBar
  //       setState(() {
  //         showAppBar=true;
  //       });
  //     }else{
  //       // don't show appBar
  //       setState(() {
  //         showAppBar=false;
  //       });
  //     }
  //   });
  //   super.initState();
  // }

  final angle1 = math.pi * 1.0;
  final angle2 = math.pi * 2.0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.controller,
      padding: EdgeInsets.zero,
      // Starting column
      children: [
      //  First part
        SizedBox(
          height: 223.h,
          width: 375.w,
          child: Stack(children: [
            showAppBar==true?Container():firstBlueContainer(),
            timerWidget(),
          ]),
        ),
        // Second part -- row
        AppSize.widgetGap(height: 14.h, width: 0),
        // horizontal list of Card
        horizontalListOfCard(),
        AppSize.widgetGap(height: 9.35, width: 9),
        // Learning plan Widget
        learningPlanWidget(angle1: angle1, angle2: angle2),
        // Meet Up Cards
        meetUpCard(),
        AppSize.widgetGap(height: 20),
        meetUpCard(),
      ],
    );
  }
}
