import 'package:bill_pay/utils/custom_color.dart';
import 'package:bill_pay/view/home/referral.dart';
import 'package:bill_pay/widgets/sidebar_item.dart';
import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            FaIcon(
              FontAwesomeIcons.solidUser,
              color: Color(0xff58D6BE),
              size: 100,
            ),
            const SizedBox(height: 15.0),
            TextBuilder(
              text: 'PETER PARKER',
              color: kPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 10.0),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextBuilder(
                  text: 'Edit Profile',
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Divider(thickness: 1.5),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SideBarItem(
                      title: 'Referral',
                      icon: Icons.card_giftcard,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Referral()));
                      },
                    ),
                    Divider(thickness: 1.5),
                    SideBarItem(
                      title: 'Contact',
                      icon: Icons.email,
                      onTap: () {},
                    ),
                    Divider(thickness: 1.5),
                    SideBarItem(
                      title: 'About AdikpoPay',
                      icon: Icons.info,
                      onTap: () {},
                    ),
                    Divider(thickness: 1.5),
                    SideBarItem(
                      title: 'Logout',
                      icon: Icons.logout,
                      onTap: () {},
                      color: Colors.red,
                    ),
                    Divider(thickness: 1.5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
