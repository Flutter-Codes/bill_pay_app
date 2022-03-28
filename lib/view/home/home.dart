import 'package:bill_pay/utils/custom_color.dart';
import 'package:bill_pay/view/home/data_bundle.dart';
import 'package:bill_pay/view/home/fund_transfer.dart';
import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:bill_pay/widgets/top_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.smartphone,
      Icons.settings_remote,
      FontAwesomeIcons.lightbulb,
      Icons.tv,
      Icons.account_balance_wallet_outlined,
      Icons.school_outlined,
      FontAwesomeIcons.moneyBillTransfer,
      Icons.settings_cell,
    ];
    List<String> title = [
      'Mobile Airtime',
      'Data Bundle',
      'Electricity Bill',
      'Cable TV',
      'Fund Wallet',
      'WAAEC/NECO/JAMB',
      'Fund Transfer',
      'International Top up',
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF8FAFF),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.solidUser,
                        color: Color(0xff58D6BE),
                        size: 35,
                      ),
                      const SizedBox(width: 10.0),
                      TextBuilder(
                        text: 'HI, PETER',
                        color: kPrimary,
                        fontWeight: FontWeight.w700,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      TextBuilder(
                        text: 'Add money',
                        color: kPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(width: 10.0),
                      InkWell(
                        onTap: () {},
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kPrimary,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: FaIcon(
                                FontAwesomeIcons.plus,
                                color: kPrimary,
                                size: 14,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 30.0),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff063578),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextBuilder(
                      text: 'Available Balance',
                      color: Colors.white70,
                    ),
                    const SizedBox(height: 10.0),
                    TextBuilder(
                      text: 'N 0.00',
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextBuilder(
                  text: 'Services',
                  fontSize: 15,
                  color: Color(0xff4B81AF),
                ),
              ),
              const SizedBox(height: 10.0),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 1,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemCount: title.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 15, top: 10),
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int i) {
                  return InkWell(
                    onTap: () {
                      if (i == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DataBundle(),
                          ),
                        );
                      } else if (i == 6)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FundTransfer(),
                          ),
                        );
                    },
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              icons[i],
                              color: kPrimary,
                            ),
                            const SizedBox(height: 8.0),
                            TextBuilder(
                              text: title[i],
                              color: kPrimary,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              maxLines: 1,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TopUpCard(
                      title: 'MTN 1GB\nfor 30days\nN475',
                      onTap: () {},
                      bgColor: Color(0xff063578),
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Expanded(
                    child: TopUpCard(
                      title: 'MTN 21GB for 30days N950',
                      onTap: () {},
                      bgColor: Color(0xff7E2E83),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
