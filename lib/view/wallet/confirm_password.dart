import 'package:bill_pay/utils/custom_color.dart';
import 'package:bill_pay/widgets/custom_btn.dart';
import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:flutter/material.dart';

class ConfirmPass extends StatefulWidget {
  const ConfirmPass({Key? key}) : super(key: key);

  @override
  State<ConfirmPass> createState() => _ConfirmPassState();
}

class _ConfirmPassState extends State<ConfirmPass> {
  TextEditingController _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 1,
          title: TextBuilder(
            text: 'Confirm your payment',
            color: kPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextBuilder(
                text: 'Enter PIN',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: kPrimary,
              ),
              const SizedBox(height: 15.0),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  border: Border.all(color: kPrimary),
                ),
                child: TextFormField(
                  controller: _pass,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: kPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xff7293B9),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              CustomBtn(
                title: 'Confirm Payment',
                width: MediaQuery.of(context).size.width * 0.6,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
