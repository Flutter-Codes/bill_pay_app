import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String? title;
  final double? height, width;
  final Function()? onTap;
  final Color? bgColor;
  const CustomBtn({
    Key? key,
    this.title,
    this.height = 45,
    this.width = double.infinity,
    this.onTap,
    this.bgColor = const Color(0xff294175),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      minWidth: width,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      color: bgColor,
      onPressed: onTap,
      child: TextBuilder(
        text: title,
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}
