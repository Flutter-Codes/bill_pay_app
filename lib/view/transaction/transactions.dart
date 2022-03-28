import 'package:bill_pay/utils/custom_color.dart';
import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:bill_pay/widgets/top_menu_item.dart';
import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  int selectdIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        title: TextBuilder(
          text: 'Transactions',
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
                        title: 'All',
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
                        title: 'Debit',
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
                        title: 'Credit',
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
            ListView.builder(
              itemCount: 15,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20.0),
                              TextBuilder(
                                text: 'Mobile Airtime',
                                color: kPrimary,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(height: 15.0),
                              TextBuilder(
                                text: '20th May 2020',
                                color: kPrimary,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                              const SizedBox(height: 8.0),
                            ],
                          ),
                          TextBuilder(
                            text: '-200',
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
