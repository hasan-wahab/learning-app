
abstract class OnboardingPersonStates {
   int value;
  OnboardingPersonStates({required this.value});
}

class InitState extends OnboardingPersonStates {
  InitState({required super.value});
}

class NextPageState extends OnboardingPersonStates {
  NextPageState({required super.value});
}
