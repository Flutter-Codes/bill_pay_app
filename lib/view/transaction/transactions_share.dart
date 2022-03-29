import 'package:bill_pay/utils/custom_color.dart';
import 'package:bill_pay/widgets/custom_btn.dart';
import 'package:bill_pay/widgets/textbuilder.dart';

import 'package:flutter/material.dart';

class TransactionsShare extends StatefulWidget {
  const TransactionsShare({Key? key}) : super(key: key);

  @override
  State<TransactionsShare> createState() => _TransactionsShareState();
}

class _TransactionsShareState extends State<TransactionsShare> {
  int selectdIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff334F8D),
          centerTitle: true,
          title: TextBuilder(
            text: 'Success',
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          // color: Colors.lightGreen,
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              TextBuilder(
                text: 'Hurray!! your transaction\nwas successfull',
                fontSize: 16,
                color: kPrimary,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
              ),
              Spacer(),
              Container(
                height: 180,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: kPrimary, width: 2),
                ),
                child: Icon(
                  Icons.check,
                  color: kPrimary,
                  size: 50,
                ),
              ),
              Spacer(),
              CustomBtn(
                title: 'Share',
                width: MediaQuery.of(context).size.width * 0.6,
                onTap: () {},
              ),
              const SizedBox(height: 20.0),
              CustomBtn(
                title: 'Go Home',
                width: MediaQuery.of(context).size.width * 0.6,
                bgColor: kOrangeBtn,
                onTap: () {},
              ),
              const SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
    );
  }
}
