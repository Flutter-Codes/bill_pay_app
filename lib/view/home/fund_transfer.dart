import 'package:bill_pay/utils/custom_color.dart';
import 'package:bill_pay/widgets/custom_btn.dart';
import 'package:bill_pay/widgets/custom_textfield.dart';
import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FundTransfer extends StatefulWidget {
  const FundTransfer({Key? key}) : super(key: key);

  @override
  State<FundTransfer> createState() => _FundTransferState();
}

class _FundTransferState extends State<FundTransfer> {
  TextEditingController _amount = TextEditingController();
  TextEditingController _bankName = TextEditingController();
  TextEditingController _accountNo = TextEditingController();
  TextEditingController _addNote = TextEditingController();
  String? selectedItem;
  List<String> itemsList = ['BOB', 'Bank of India', 'Union Bank'];
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
            text: 'Fund Transfer',
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextBuilder(
                    text: 'Make transkfer here',
                    color: kPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    children: [
                      TextBuilder(
                        text: 'Add money',
                        color: kPrimary,
                        fontWeight: FontWeight.w600,
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
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
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
              ),
              const SizedBox(height: 25.0),
              Row(
                children: [
                  Icon(
                    Icons.timer,
                    color: Colors.red[300],
                    size: 16,
                  ),
                  const SizedBox(width: 10.0),
                  TextBuilder(text: 'Most recent')
                ],
              ),
              const SizedBox(height: 10.0),
              Container(
                // color: Colors.lightGreen,
                height: 95,
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int i) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color(0xff6886AF),
                                shape: BoxShape.circle,
                              ),
                              child: TextBuilder(
                                text: 'GE',
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            TextBuilder(
                              text: 'Grace Emmanuel',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff6886AF),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              CustomTextField(
                hintText: 'Amount',
                enableSufix: false,
                inputType: TextInputType.number,
                textController: _amount,
              ),
              const SizedBox(height: 10.0),
              CustomTextField(
                hintText: 'Select Bank',
                enableSufix: true,
                items: itemsList,
                selectedItem: selectedItem,
                textController: _bankName,
                onTap: () {
                  selectBank(context);
                },
                onChanged: (val) {
                  setState(() {
                    selectedItem = val;
                  });
                },
              ),
              const SizedBox(height: 10.0),
              CustomTextField(
                hintText: 'Account number',
                enableSufix: false,
                inputType: TextInputType.number,
                textController: _accountNo,
              ),
              const SizedBox(height: 10.0),
              CustomTextField(
                hintText: 'Add a note (optional)',
                enableSufix: false,
                maxline: null,
                textController: _addNote,
              ),
              const SizedBox(height: 25.0),
              CustomBtn(
                title: 'Continue',
                width: MediaQuery.of(context).size.width * 0.6,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  selectBank(BuildContext context) {
    showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              contentPadding: EdgeInsets.zero,
              scrollable: true,
              content: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextBuilder(
                      text: 'Select a Bank',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(thickness: 1.5, height: 1),
                  Column(
                    children: List.generate(
                      itemsList.length,
                      (index) => InkWell(
                        onTap: () {
                          setState(() {
                            selectedItem = itemsList[index];
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextBuilder(
                                text: itemsList[index],
                                fontWeight: FontWeight.w400,
                              ),
                              selectedItem == itemsList[index]
                                  ? Icon(
                                      Icons.check,
                                      color: kPrimary,
                                    )
                                  : Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(thickness: 1.5, height: 1),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: TextBuilder(
                              text: 'Dismiss',
                              color: kPrimary,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        VerticalDivider(thickness: 1.5, width: 1),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: TextBuilder(
                              text: 'Okay',
                              color: kPrimary,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
