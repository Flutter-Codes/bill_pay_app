import 'package:bill_pay/utils/custom_color.dart';
import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:flutter/material.dart';

class TopUpCard extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  final Color? bgColor;
  final double? width;
  const TopUpCard({
    Key? key,
    this.title,
    this.onTap,
    this.bgColor,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bgColor,
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 30, left: 8),
              child: TextBuilder(
                text: title,
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Positioned(
                bottom: 0,
                right: 20,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextBuilder(
                    text: 'Top up',
                    color: kPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
