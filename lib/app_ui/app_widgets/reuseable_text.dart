import 'package:flutter/material.dart';

class ReuseableText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLine;
  const ReuseableText({super.key, required this.text,  this.textStyle,  this.textAlign, this.overflow,this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: textStyle,textAlign: textAlign,overflow: overflow,maxLines: maxLine,);
  }
}
