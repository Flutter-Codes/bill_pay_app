import 'package:bill_pay/utils/custom_color.dart';
import 'package:bill_pay/view/home/home.dart';
import 'package:bill_pay/view/wallet/wallet.dart';
import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  final PageController controller =
      PageController(initialPage: 0, keepPage: true);
  List<Widget> _pages = [
    Home(),
    Wallet(),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.green,
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.lightBlue,
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black26,
    ),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: _pages.length,
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (val) {
                setState(() {
                  currentIndex = val;
                  print('currentIndex $currentIndex');
                });
              },
              itemBuilder: (context, index) {
                return _pages[index];
              },
            ),
          ),
          Card(
            color: Colors.white,
            margin: EdgeInsets.zero,
            child: Column(
              children: [
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                Container(
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BottomItem(
                        icon: 'assets/icons/home.png',
                        color: currentIndex == 0 ? kPrimary : kInactive,
                        text: 'Home',
                        onPressed: () {
                          setState(() {
                            currentIndex = 0;
                            controller.animateToPage(0,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.ease);
                          });
                        },
                      ),
                      BottomItem(
                        icon: 'assets/icons/wallet.png',
                        color: currentIndex == 1 ? kPrimary : kInactive,
                        text: 'Wallet',
                        onPressed: () {
                          setState(() {
                            currentIndex = 1;
                            controller.animateToPage(1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.decelerate);
                          });
                        },
                      ),
                      BottomItem(
                        icon: 'assets/icons/sync.png',
                        color: currentIndex == 2 ? kPrimary : kInactive,
                        text: 'Transactions',
                        onPressed: () {
                          setState(() {
                            currentIndex = 2;
                            controller.animateToPage(2,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.decelerate);
                          });
                        },
                      ),
                      BottomItem(
                        icon: 'assets/icons/user.png',
                        color: currentIndex == 3 ? kPrimary : kInactive,
                        text: 'Profile',
                        onPressed: () {
                          setState(() {
                            currentIndex = 3;
                            controller.animateToPage(3,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.decelerate);
                          });
                        },
                      ),
                      BottomItem(
                        icon: 'assets/icons/menu.png',
                        color: currentIndex == 4 ? kPrimary : kInactive,
                        text: 'More',
                        onPressed: () {
                          setState(() {
                            currentIndex = 4;
                            controller.animateToPage(4,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.decelerate);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

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
    );
  }
}
