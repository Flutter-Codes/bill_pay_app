import 'package:bill_pay/utils/custom_color.dart';
import 'package:bill_pay/view/home/home.dart';
import 'package:bill_pay/view/profile/profile.dart';
import 'package:bill_pay/view/transaction/transactions.dart';
import 'package:bill_pay/view/wallet/wallet.dart';
import 'package:bill_pay/widgets/bottom_item.dart';
import 'package:bill_pay/widgets/custom_drawer.dart';

import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  late PageController controller;
  final GlobalKey<ScaffoldState> key = GlobalKey();
  List<Widget> _pages = [
    Home(),
    Wallet(),
    Transactions(),
    Profile(),
  ];
  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: BottomItem(
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
                      ),
                      Expanded(
                        child: BottomItem(
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
                      Expanded(
                        child: BottomItem(
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
                      ),
                      Expanded(
                        child: BottomItem(
                          icon: 'assets/icons/menu.png',
                          color: currentIndex == 4 ? kPrimary : kInactive,
                          text: 'More',
                          onPressed: () {
                            setState(() {
                              key.currentState!.openDrawer();
                            });
                          },
                        ),
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
