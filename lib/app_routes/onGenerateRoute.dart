import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodi/app_routes/app_routes.dart';
import 'package:foodi/app_ui/datail_screen/detail_bloc/detail_bloc.dart';
import 'package:foodi/app_ui/my_courses/my_course_bloc/my_course_bloc.dart';
import 'package:foodi/app_ui/my_courses/my_courses_screen.dart';
import 'package:foodi/app_ui/nave_bar/course_screen/course_screen.dart';
import 'package:foodi/app_ui/datail_screen/detail_screen.dart';
import 'package:foodi/app_ui/nave_bar/course_screen/course_screen_bloc/course_screen_bloc.dart';
import 'package:foodi/app_ui/nave_bar/home_screen/home_screen.dart';
import 'package:foodi/app_ui/nave_bar/home_screen/home_screen_bloc/home_screen_bloc.dart';
import 'package:foodi/app_ui/nave_bar/message_screen/message_screen.dart';
import 'package:foodi/app_ui/nave_bar/message_screen/message_screen_bloc/message_screen_bloc.dart';
import 'package:foodi/app_ui/nave_bar/nav_bar.dart';
import 'package:foodi/app_ui/nave_bar/nave_bar_bloc/nave_bar_bloc.dart';
import 'package:foodi/app_ui/nave_bar/profile_screen/profile_screen.dart';
import 'package:foodi/app_ui/nave_bar/profile_screen/profile_screen_bloc/profile_screen_bloc.dart';
import 'package:foodi/app_ui/nave_bar/search_screens/search_screen.dart';
import 'package:foodi/app_ui/nave_bar/search_screens/search_screen_bloc/search_screen_bloc.dart';
import 'package:foodi/app_ui/onboarding_scr/on_boading_screen1.dart';
import 'package:foodi/app_ui/onboarding_scr/onboarding_person/on_boarding_person_class.dart';
import 'package:foodi/app_ui/onboarding_scr/on_boarding_secree2.dart';
import 'package:foodi/app_ui/onboarding_scr/onboarding_person/onboarding_person_bloc/onboarding_person_bloc.dart';
import 'package:foodi/app_ui/onboarding_scr/onboarding_screen3.dart';
import 'package:foodi/app_ui/payment_method/card_list/card_list_screen/card_list_screen_bloc/card_list_screen_bloc.dart';
import 'package:foodi/app_ui/payment_method/card_list/detail_screen/card_detail_screen.dart';
import 'package:foodi/app_ui/payment_method/card_list/card_list_screen/card_list_screen.dart';
import 'package:foodi/app_ui/payment_method/card_list/detail_screen/card_detail_screen_bloc/card_details_screen_bloc.dart';
import 'package:foodi/app_ui/payment_method/card_list/sucess_screen.dart';
import 'package:foodi/app_ui/user_auth/continue_with_phone/continue_with_phone_bloc/continue_phone_bloc.dart';
import 'package:foodi/app_ui/user_auth/continue_with_phone/continue_with_phone_screen.dart';
import 'package:foodi/app_ui/user_auth/login_screen/login_screen.dart';
import 'package:foodi/app_ui/user_auth/login_screen/login_screen_bloc/login_screen_bloc.dart';
import 'package:foodi/app_ui/user_auth/otp_screen/otp_screen.dart';
import 'package:foodi/app_ui/user_auth/otp_screen/otp_screen_bloc/otp_screen_bloc.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_bloc.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_screen.dart';
import 'package:foodi/app_ui/video_player/video_player_bloc/video_player_bloc.dart';
import 'package:foodi/app_ui/video_player/video_player_screen.dart';

class AppRouting {
  final String? routeName;
  final Widget route;
  dynamic bloc;

  AppRouting({
    required this.routeName,
    required this.route,
    required this.bloc,
  });

  static List<AppRouting> routeList = [
    AppRouting(
      routeName: AppRoutes.onBoardingPersonClass,
      route: OnBoardingPersonClass(),
      bloc: BlocProvider(create: (_) => OnboardingPersonBloc()),
    ),

    AppRouting(
      routeName: AppRoutes.signUpScreen,
      route: SignUpScreen(),
      bloc: BlocProvider(create: (_) => SignUpScreenBloc()),
    ),
    AppRouting(
      routeName: AppRoutes.loginScreen,
      route: LoginScreen(),
      bloc: BlocProvider(create: (_) => LoginScreenBloc()),
    ),
    AppRouting(
      routeName: AppRoutes.continueWithPhoneScreen,
      route: ContinueWithPhoneScreen(),
      bloc: BlocProvider(create: (_) => ContinuePhoneBloc(0)),
    ),
    AppRouting(
      routeName: AppRoutes.otpScreen,
      route: OtpScreen(),
      bloc: BlocProvider(create: (_) => OTPScreenBloc(0)),
    ),
    AppRouting(
      routeName: AppRoutes.naveBar,
      route: NavBar(),
      bloc: BlocProvider(create: (_) => NaveBarBloc(0)),
    ),
    AppRouting(
      routeName: AppRoutes.homeScreen,
      route: HomeScreen(),
      bloc: BlocProvider(create: (_) => HomeScreenBloc(0)),
    ),
    AppRouting(
      routeName: AppRoutes.courseScreen,
      route: CourseScreen(),
      bloc: BlocProvider(create: (_) => CourseSreenBloc(0)),
    ),
    AppRouting(
      routeName: AppRoutes.searchScreen,
      route: SearchScreen(),
      bloc: BlocProvider(create: (_) => SearchScreenBloc(0)),
    ),
    AppRouting(
      routeName: AppRoutes.messageScreen,
      route: MessageScreen(),
      bloc: BlocProvider(create: (_) => MessageScreenBloc(0)),
    ),
    AppRouting(
      routeName: AppRoutes.profileScreen,
      route: ProfileScreen(),
      bloc: BlocProvider(create: (_) => ProfileScreenBloc(0)),
    ),
    AppRouting(
      routeName: AppRoutes.detailScreen,
      route: DetailScreen(),
      bloc: BlocProvider(create: (_) => DetailBloc(0)),
    ),
    AppRouting(
      routeName: AppRoutes.videoPlayerScreen,
      route: VideoPlayerScreen(),
      bloc: BlocProvider(create: (_) => VideoPlayerScreenBloc(0)),
    ),
    AppRouting(
      routeName: AppRoutes.paymentCardList,
      route: CardList(),
      bloc: BlocProvider(create: (_) => VideoPlayerScreenBloc(0)),
    ),
    AppRouting(
      routeName: AppRoutes.cardDetailScreen,
      route: CardDetailScreen(),
      bloc: BlocProvider(create: (_) => CardDetailScreenBloc(0)),
    ),
    AppRouting(
      routeName: AppRoutes.successScreen,
      route: SuccessScreen(),
      bloc: BlocProvider(create: (_) => DetailBloc(0)),
    ),
    AppRouting(
      routeName: AppRoutes.myCoursesScreen,
      route: MyCoursesScreen(),
      bloc: BlocProvider(create: (_) => MyCourseScreenBloc(0)),
    ),
  ];

  static blocProviderList() {
    List<BlocProvider> allProviders = [];
    for (var bloc in routeList) {
      allProviders.add(bloc.bloc);
    }
    return allProviders;
  }

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

      return CupertinoPageRoute(builder: (_) => OnBoardingPersonClass());
    } else {
      return CupertinoPageRoute(builder: (_) => OnBoardingPersonClass());
    }
  }
}
