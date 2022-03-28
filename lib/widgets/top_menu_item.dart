import 'package:bill_pay/utils/custom_color.dart';
import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:flutter/material.dart';

enum PositionSide { left, middle, right }

class TopMenuItem extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  final double? height, width;
  final Color? textColor, bgColor;
  final double? topLeft, topRight, bottomLeft, bottomRight;
  const TopMenuItem({
    Key? key,
    this.title,
    this.onTap,
    this.height = 25,
    this.width = 100,
    this.textColor,
    this.bgColor,
    this.topLeft = 0,
    this.topRight = 0,
    this.bottomLeft = 0,
    this.bottomRight = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeft!),
              topRight: Radius.circular(topRight!),
              bottomLeft: Radius.circular(bottomLeft!),
              bottomRight: Radius.circular(bottomRight!)),
          border: Border.all(
            color: kPrimary,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        child: TextBuilder(
          text: title,
          color: textColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
