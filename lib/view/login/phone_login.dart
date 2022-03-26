import 'package:bill_pay/utils/custom_color.dart';
import 'package:bill_pay/view/login/phone_login_otp.dart';

import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:flutter/material.dart';

class PhoneLogin extends StatelessWidget {
  const PhoneLogin({Key? key}) : super(key: key);
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
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Phone Number',
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff7293B9),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                MaterialButton(
                  height: 48,
                  minWidth: double.infinity,
                  color: kOrangeBtn,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PhoneLoginOtp()));
                  },
                  child: TextBuilder(
                    text: 'Continue',
                    color: kPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
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
