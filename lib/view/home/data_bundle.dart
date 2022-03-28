import 'package:bill_pay/utils/custom_color.dart';
import 'package:bill_pay/widgets/custom_btn.dart';
import 'package:bill_pay/widgets/custom_textfield.dart';
import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:flutter/material.dart';

class DataBundle extends StatefulWidget {
  const DataBundle({Key? key}) : super(key: key);

  @override
  State<DataBundle> createState() => _DataBundleState();
}

class _DataBundleState extends State<DataBundle> {
  TextEditingController _selectNetwork = TextEditingController();
  TextEditingController _selectPlan = TextEditingController();
  TextEditingController _selectPhone = TextEditingController();
  String? selectedItem;
  List<String> itemsList = ['GLD', 'MTN', '9MOBILE', 'AIRTEL'];
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
            text: 'Data Bundle',
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.info_outline,
                color: Colors.white,
                size: 22,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(size: 50),
                  const SizedBox(width: 15.0),
                  TextBuilder(
                    text: 'Adikpo Pay',
                    fontSize: 30,
                    color: kPrimary,
                    fontWeight: FontWeight.w900,
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              CustomTextField(
                hintText: 'Select a Network',
                enableSufix: true,
                items: itemsList,
                selectedItem: selectedItem,
                textController: _selectNetwork,
                onTap: () {
                  selectNetwork(context);
                },
                onChanged: (val) {
                  setState(() {
                    selectedItem = val;
                  });
                },
              ),
              const SizedBox(height: 10.0),
              CustomTextField(
                hintText: 'Plan',
                enableSufix: false,
                textController: _selectPlan,
              ),
              const SizedBox(height: 10.0),
              CustomTextField(
                hintText: 'Phone number',
                enableSufix: false,
                inputType: TextInputType.number,
                textController: _selectPhone,
              ),
              const SizedBox(height: 20.0),
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

  selectNetwork(BuildContext context) {
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
                      text: 'Select a Network',
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
