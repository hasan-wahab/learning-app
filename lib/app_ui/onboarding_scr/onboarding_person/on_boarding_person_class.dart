import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/onboarding_scr/on_boading_screen1.dart';
import 'package:foodi/app_ui/onboarding_scr/on_boarding_secree2.dart';
import 'package:foodi/app_ui/onboarding_scr/onboarding_person/onboarding_person_bloc/onboarding_person_bloc.dart';
import 'package:foodi/app_ui/onboarding_scr/onboarding_person/onboarding_person_bloc/onboarding_person_events.dart';
import 'package:foodi/app_ui/onboarding_scr/onboarding_person/onboarding_person_bloc/onboarding_person_states.dart';
import 'package:foodi/app_ui/onboarding_scr/onboarding_screen3.dart';
import 'package:foodi/app_ui/onboarding_scr/onboarding_widgets.dart';

import '../../../local_storage_service/local_data/local_data.dart';

class OnBoardingPersonClass extends StatelessWidget {
  const OnBoardingPersonClass({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingPersonBloc, OnboardingPersonStates>(
      builder: (context, state) {
        PageController pageController = PageController();
        pageControllerFunc() {
          pageController.animateToPage(
            state.value,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeIn,
          );
        }

        return Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (pageValue) {
                context.read<OnboardingPersonBloc>().add(
                  NextPageEvent(value: pageValue),
                );
              },
              children: [
                OnBoadingScreen1(),
                OnBoardingSecreen2(),
                OnboardingScreen3(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.topCenter,
                height: 215.h,
                child: threeDots(currentValue: state.value),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.topCenter,
                height: 120.h,
                child: state.value != 2
                    ? circleButton(
                        context: context,
                        onTap: () {
                          context.read<OnboardingPersonBloc>().add(
                            NextPageEvent(value: state.value++),
                          );
                          pageControllerFunc();

                        },
                      )
                    : Container(),
              ),
            ),
          ],
        );
      },
    );
  }
}
