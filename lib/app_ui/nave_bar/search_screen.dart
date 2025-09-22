import 'package:flutter/material.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: ReuseableText(text: 'Search Screen'));
  }
}
