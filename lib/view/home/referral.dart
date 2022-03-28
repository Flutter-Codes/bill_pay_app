import 'package:bill_pay/utils/custom_color.dart';
import 'package:bill_pay/widgets/custom_btn.dart';
import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Referral extends StatelessWidget {
  const Referral({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        title: TextBuilder(
          text: 'Referral',
          color: kPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 5),
              decoration: BoxDecoration(
                color: Color(0xff6684AE),
                borderRadius: BorderRadius.circular(6),
              ),
              child: TextBuilder(
                text:
                    'Get up to N50 on your next \ntransaction by inviting your friends \nto use AdikpoPay using the link \nbelow.',
                color: Colors.white,
                textAlign: TextAlign.center,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10.0),
            InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: "your text")).then(
                  (value) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Referral code copied to clipboard"),
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xffAFBFD5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextBuilder(
                      text: 'https://adikpopay.com.ng/?\nref=2394JE',
                      color: Color(0xff7B95B8),
                      textAlign: TextAlign.left,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    Icon(
                      Icons.copy_rounded,
                      color: Color(0xff7B95B8),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            CustomBtn(
              title: 'Share',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
