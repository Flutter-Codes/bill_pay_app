import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:flutter/material.dart';

class BottomItem extends StatelessWidget {
  final String? icon;
  final String? text;
  final Color? color;
  final Function()? onPressed;
  final double? height, width;
  const BottomItem({
    Key? key,
    this.icon,
    this.text,
    this.color,
    this.onPressed,
    this.height = 30,
    this.width = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon!,
              height: height,
              width: width,
              color: color,
            ),
            const SizedBox(height: 5.0),
            TextBuilder(
              text: text,
              color: color,
              fontWeight: FontWeight.w400,
            )
          ],
        ),
      ),
    );
  }
}
