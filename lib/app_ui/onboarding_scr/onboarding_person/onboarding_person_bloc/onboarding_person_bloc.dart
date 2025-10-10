import 'package:foodi/app_ui/onboarding_scr/onboarding_person/onboarding_person_bloc/onboarding_person_events.dart';
import 'package:foodi/app_ui/onboarding_scr/onboarding_person/onboarding_person_bloc/onboarding_person_states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPersonBloc
    extends Bloc<OnboardingPersonEvents, OnboardingPersonStates> {
  OnboardingPersonBloc() : super(InitState(value: 0)) {
    on<NextPageEvent>((event, emit) {
      emit(NextPageState(value: event.value));
    });
  }
}
