abstract class OnboardingPersonEvents {}

class NextPageEvent extends OnboardingPersonEvents{
  int value;
  NextPageEvent({required this.value});
}

