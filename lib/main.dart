import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/nave_bar/nav_bar.dart';
import 'package:foodi/app_ui/onboarding_scr/on_boading_screen1.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),

      builder: (context, child) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: OnBoadingScreen1(),
    );
  }
}
