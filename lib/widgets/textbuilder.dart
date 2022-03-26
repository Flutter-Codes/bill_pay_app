import 'package:flutter/material.dart';

class TextBuilder extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? height;
  final double? letterSpacing;
  final double? wordSpacing;
  final FontWeight? fontWeight;
  final Color? color;
  const TextBuilder({
    Key? key,
    required this.text,
    this.fontSize,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.height,
    this.letterSpacing,
    this.wordSpacing,
    this.fontWeight,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
      ),
    );
  }
}
