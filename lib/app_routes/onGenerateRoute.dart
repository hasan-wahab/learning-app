import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodi/app_routes/app_routes.dart';
import 'package:foodi/app_ui/nave_bar/course_screen/course_screen.dart';
import 'package:foodi/app_ui/nave_bar/home_screen/home_screen.dart';
import 'package:foodi/app_ui/nave_bar/message_screen.dart';
import 'package:foodi/app_ui/nave_bar/nav_bar.dart';
import 'package:foodi/app_ui/nave_bar/profile_screen.dart';
import 'package:foodi/app_ui/nave_bar/search_screen.dart';
import 'package:foodi/app_ui/onboarding_scr/on_boading_screen1.dart';
import 'package:foodi/app_ui/onboarding_scr/on_boarding_secree2.dart';
import 'package:foodi/app_ui/onboarding_scr/onboarding_screen3.dart';
import 'package:foodi/app_ui/user_auth/continue_with_phone_screen.dart';
import 'package:foodi/app_ui/user_auth/login_screen.dart';
import 'package:foodi/app_ui/user_auth/otp_screen.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen.dart';

class AppRouting {
  final String? routeName;
  final Widget route;

  AppRouting({required this.routeName, required this.route});

  static List<AppRouting> routeList = [
    AppRouting(
      routeName: AppRoutes.firstOnboardingScreen,
      route: OnBoadingScreen1(),
    ),
    AppRouting(
      routeName: AppRoutes.secondOnboardingScreen,
      route: OnBoardingSecreen2(),
    ),
    AppRouting(
      routeName: AppRoutes.thirdOnboardingScreen,
      route: OnboardingScreen3(),
    ),
    AppRouting(routeName: AppRoutes.signUpScreen, route: SignUpScreen()),
    AppRouting(routeName: AppRoutes.loginScreen, route: LoginScreen()),
    AppRouting(
      routeName: AppRoutes.continueWithPhoneScreen,
      route: ContinueWithPhoneScreen(),
    ),
    AppRouting(routeName: AppRoutes.otpScreen, route: OtpScreen()),
    AppRouting(routeName: AppRoutes.naveBar, route: NavBar()),
    AppRouting(routeName: AppRoutes.homeScreen, route: HomeScreen()),
    AppRouting(routeName: AppRoutes.courseScreen, route: CourseScreen()),
    AppRouting(routeName: AppRoutes.searchScreen, route: SearchScreen()),
    AppRouting(routeName: AppRoutes.messageScreen, route: MessageScreen()),
    AppRouting(routeName: AppRoutes.profileScreen, route: ProfileScreen()),
  ];

  static MaterialPageRoute onGenerateRoute(
    RouteSettings settings,
    BuildContext context,
  ) {
    if (settings.name!.isNotEmpty) {
      final result = routeList
          .where((test) => test.routeName == settings.name)
          .toList();
      if (result.isNotEmpty) {
        return MaterialPageRoute(
          builder: (_) => result.first.route,
          settings: settings,
        );
      }

      return MaterialPageRoute(builder: (_) => OnBoadingScreen1());
    } else {
      return MaterialPageRoute(builder: (_) => OnBoadingScreen1());
    }
  }
}
