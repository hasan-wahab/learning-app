import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_routes/onGenerateRoute.dart';

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

      onGenerateRoute: (RouteSettings settings) =>
          AppRouting.onGenerateRoute(settings, context),
    );
  }
}
