import 'package:bill_pay/utils/custom_color.dart';
import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:bill_pay/widgets/top_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectdIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffF9F9FC),

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        title: TextBuilder(
          text: 'Profile',
          color: kPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: TopMenuItem(
                        title: 'Personal',
                        topLeft: 4,
                        bottomLeft: 4,
                        onTap: () {
                          setState(() {
                            selectdIndex = 0;
                          });
                        },
                        bgColor: selectdIndex == 0 ? kPrimary : Colors.white,
                        textColor: selectdIndex == 0 ? Colors.white : kPrimary),
                  ),
                  Expanded(
                    child: TopMenuItem(
                        title: 'Security',
                        onTap: () {
                          setState(() {
                            selectdIndex = 1;
                          });
                        },
                        bgColor: selectdIndex == 1 ? kPrimary : Colors.white,
                        textColor: selectdIndex == 1 ? Colors.white : kPrimary),
                  ),
                  Expanded(
                    child: TopMenuItem(
                        title: 'Features',
                        topRight: 4,
                        bottomRight: 4,
                        onTap: () {
                          setState(() {
                            selectdIndex = 2;
                          });
                        },
                        bgColor: selectdIndex == 2 ? kPrimary : Colors.white,
                        textColor: selectdIndex == 2 ? Colors.white : kPrimary),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            if (selectdIndex == 1) SecurityScreen(),
            if (selectdIndex == 2) FeaturesScreen(),
          ],
        ),
      ),
    );
  }
}

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        Center(
          child: InkWell(
            onTap: () {},
            child: FaIcon(
              FontAwesomeIcons.solidUser,
              color: Color(0xff58D6BE),
              size: 100,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        TextBuilder(
          text: 'Tap to change picture',
          color: kPrimary,
          fontWeight: FontWeight.w300,
        ),
        const SizedBox(height: 40.0),
        Container(
          color: Color(0xffF9F9FC),
          child: Column(
            children: [
              ProfileSecurityItem(
                title: 'Email',
                suffixEnable: true,
                suffxText: 'peter@sample.com',
                onTap: () {},
              ),
              ProfileSecurityItem(
                title: 'Phone number',
                suffixEnable: true,
                suffxText: '+23480123456',
                onTap: () {},
              ),
              ProfileSecurityItem(
                title: 'PASSWORD & PIN',
                textColor: Color(0xff777778),
                onTap: () {},
              ),
              ProfileFeaturesItem(
                title: 'Change Password',
                onTap: () {},
              ),
              ProfileFeaturesItem(
                title: 'Verify BVN',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        Center(
          child: InkWell(
            onTap: () {},
            child: FaIcon(
              FontAwesomeIcons.solidUser,
              color: Color(0xff58D6BE),
              size: 100,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        TextBuilder(
          text: 'Tap to change picture',
          color: kPrimary,
          fontWeight: FontWeight.w300,
        ),
        const SizedBox(height: 40.0),
        Container(
          color: Color(0xffF9F9FC),
          child: Column(
            children: [
              ProfileFeaturesItem(
                title: 'Cards & Payment Methods',
                onTap: () {},
              ),
              ProfileFeaturesItem(
                title: 'Download Statement of Accounts',
                onTap: () {},
              ),
              ProfileFeaturesItem(
                title: 'Support',
                onTap: () {},
              ),
              ProfileFeaturesItem(
                title: 'Terms & Conditions',
                onTap: () {},
              ),
              ProfileFeaturesItem(
                title: 'Privacy & Policy',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileFeaturesItem extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  const ProfileFeaturesItem({
    Key? key,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextBuilder(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: kPrimary,
                ),
                Icon(
                  Icons.east,
                  color: kPrimary,
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(height: 1)),
        ],
      ),
    );
  }
}

class ProfileSecurityItem extends StatelessWidget {
  final String? title;
  final String? suffxText;
  final Function()? onTap;
  final bool? suffixEnable;
  final Color? textColor;
  const ProfileSecurityItem({
    Key? key,
    this.title,
    this.onTap,
    this.suffixEnable,
    this.suffxText,
    this.textColor = const Color(0xff070597),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextBuilder(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
                if (suffixEnable == true)
                  TextBuilder(
                    text: suffxText,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff537CAA),
                  )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(height: 1)),
        ],
      ),
    );
  }
}
