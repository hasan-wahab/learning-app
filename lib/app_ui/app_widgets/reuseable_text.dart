import 'package:flutter/material.dart';

class ReuseableText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  const ReuseableText({super.key, required this.text,  this.textStyle,  this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: textStyle,textAlign: textAlign,);
  }
}
