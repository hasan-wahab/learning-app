import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';

import 'package:foodi/app_ui/nave_bar/home_screen/home_screen_widgets.dart';
import 'package:foodi/common/app_style/app_colors.dart';

import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';
import 'package:foodi/common/images/assets_images.dart';

class HomeScreen extends StatefulWidget {
  final ScrollController? scrollController;
  bool showAppBar;
  HomeScreen({super.key, this.scrollController, this.showAppBar = false});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    widget.scrollController!.addListener(() {
      if (widget.scrollController!.position.pixels > 38) {
        setState(() {
          widget.showAppBar = true;
        });
      } else {
        setState(() {
          widget.showAppBar = false;
        });
      }
    });
    super.initState();
  }

  final angle1 = math.pi * 1.0;
  final angle2 = math.pi * 2.0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.scrollController,
      padding: EdgeInsets.zero,
      // Starting column
      children: [
        // First part
        SizedBox(
          height: widget.showAppBar != true ? 223.h : 150.h,
          width: 375.w,
          child: Stack(
            children: [
              firstBlueContainer(showAppBar: widget.showAppBar),
              timerWidget(),
            ],
          ),
        ),
        // Second part -- row
        AppSize.widgetGap(height: 14.h, width: 0),
        // horizontal list of Card
        horizontalListOfCard(),
        AppSize.widgetGap(height: 9.35, width: 9),
        // Learning plan Widget
        learningPlanWidget(angle1: angle1, angle2: angle2),

        meetUpCard(),
        AppSize.widgetGap(height: 20),
        meetUpCard(),
      ],
    );
  }
}
