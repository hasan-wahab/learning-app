import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodi/app_routes/app_routes.dart';
import 'package:foodi/app_ui/my_courses/my_courses_screen.dart';
import 'package:foodi/app_ui/nave_bar/course_screen/course_screen.dart';
import 'package:foodi/app_ui/datail_screen/detail_screen.dart';
import 'package:foodi/app_ui/nave_bar/home_screen/home_screen.dart';
import 'package:foodi/app_ui/nave_bar/message_screen.dart';
import 'package:foodi/app_ui/nave_bar/nav_bar.dart';
import 'package:foodi/app_ui/nave_bar/profile_screen.dart';
import 'package:foodi/app_ui/nave_bar/search_screens/search_screen.dart';
import 'package:foodi/app_ui/onboarding_scr/on_boading_screen1.dart';
import 'package:foodi/app_ui/onboarding_scr/on_boarding_secree2.dart';
import 'package:foodi/app_ui/onboarding_scr/onboarding_screen3.dart';
import 'package:foodi/app_ui/payment_method/card_list/detail_screen/card_detail_screen.dart';
import 'package:foodi/app_ui/payment_method/card_list/card_list_screen/card_list.dart';
import 'package:foodi/app_ui/payment_method/card_list/sucess_screen.dart';
import 'package:foodi/app_ui/user_auth/continue_with_phone_screen.dart';
import 'package:foodi/app_ui/user_auth/login_screen.dart';
import 'package:foodi/app_ui/user_auth/otp_screen.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen.dart';
import 'package:foodi/app_ui/video_player/video_player_screen.dart';

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
    AppRouting(routeName: AppRoutes.detailScreen, route: DetailScreen()),
    AppRouting(routeName: AppRoutes.videoPlayerScreen, route: VideoPlayerScreen()),
    AppRouting(routeName: AppRoutes.paymentCardList, route: CardList()),
    AppRouting(routeName: AppRoutes.cardDetailScreen, route: CardDetailScreen()),
    AppRouting(routeName: AppRoutes.successScreen, route: SuccessScreen()),
    AppRouting(routeName: AppRoutes. myCoursesScreen, route: MyCoursesScreen()),
    AppRouting(routeName: AppRoutes.forgetPasswordScreen, route: OtpScreen()),
  ];

  static CupertinoPageRoute onGenerateRoute(
    RouteSettings settings,
    BuildContext context,
  ) {
    if (settings.name!.isNotEmpty) {
      final result = routeList
          .where((test) => test.routeName == settings.name)
          .toList();
      if (result.isNotEmpty) {
        return CupertinoPageRoute(
          builder: (_) => result.first.route,
          settings: settings,
        );
      }

      return CupertinoPageRoute(builder: (_) => OnBoadingScreen1());
    } else {
      return CupertinoPageRoute(builder: (_) => OnBoadingScreen1());
    }
  }
}
