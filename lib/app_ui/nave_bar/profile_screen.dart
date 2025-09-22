import 'package:flutter/material.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: ReuseableText(text: 'Profile Screen')));
  }
}
