import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:flutter/material.dart';

class SideBarItem extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Function()? onTap;
  final Color? color;
  const SideBarItem({
    Key? key,
    this.title,
    this.icon,
    this.onTap,
    this.color = const Color(0xff070597),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
            ),
            const SizedBox(width: 10.0),
            TextBuilder(
              text: title,
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
