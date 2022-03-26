import 'package:bill_pay/utils/custom_color.dart';
import 'package:bill_pay/view/main_view.dart';

import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:flutter/material.dart';

class PhoneLoginOtp extends StatelessWidget {
  const PhoneLoginOtp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: size.height,
            width: size.width,
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [kSecondaryLight, kSecondaryDark],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterLogo(
                      size: 25,
                      style: FlutterLogoStyle.markOnly,
                    ),
                    const SizedBox(width: 8.0),
                    TextBuilder(
                      text: 'Adikpo Pay',
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ],
                ),
                Spacer(),
                TextBuilder(
                  text: 'Enter OTP sent to 0834567890',
                  fontSize: 16,
                  color: Color(0xffECD5AE),
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 15.0),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'OTP',
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: kPrimary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                MaterialButton(
                  height: 48,
                  minWidth: size.width * 0.7,
                  color: kOrangeBtn,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainView()));
                  },
                  child: TextBuilder(
                    text: 'Continue',
                    color: kPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 15.0),
                TextBuilder(
                  text: 'No, this is not my number',
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
