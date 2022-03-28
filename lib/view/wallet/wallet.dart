import 'package:bill_pay/utils/custom_color.dart';
import 'package:bill_pay/widgets/custom_btn.dart';
import 'package:bill_pay/widgets/custom_textfield.dart';
import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:bill_pay/widgets/top_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  int selectdIndex = 0;

  TextEditingController _amount = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _cardNo = TextEditingController();
  TextEditingController _holderName = TextEditingController();
  TextEditingController _expDate = TextEditingController();
  TextEditingController _cvv = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        title: TextBuilder(
          text: 'Wallet',
          color: kPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TopMenuItem(
                      title: 'My balance',
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
                      title: 'My cards',
                      topRight: 4,
                      bottomRight: 4,
                      onTap: () {
                        setState(() {
                          selectdIndex = 1;
                        });
                      },
                      bgColor: selectdIndex == 1 ? kPrimary : Colors.white,
                      textColor: selectdIndex == 1 ? Colors.white : kPrimary),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextBuilder(
                  text: selectdIndex == 0 ? 'Add money' : 'Add cards',
                  color: kPrimary,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(width: 10.0),
                InkWell(
                  onTap: () {
                    if (selectdIndex == 0) {
                      addMoneyBottom(context);
                    } else {
                      addCardBottom(context);
                    }
                  },
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
            ),
            const SizedBox(height: 10.0),
            if (selectdIndex == 0)
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
                      text: 'N 5000.00',
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            if (selectdIndex == 1) MyCards()
          ],
        ),
      ),
    );
  }

  addMoneyBottom(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              TextBuilder(
                text: 'Add money',
                color: kPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                hintText: 'Amount',
                inputType: TextInputType.number,
                enableSufix: false,
                textController: _amount,
              ),
              const SizedBox(height: 10.0),
              CustomTextField(
                hintText: 'Password',
                enableSufix: false,
                textController: _password,
              ),
              const SizedBox(height: 20.0),
              Center(
                child: CustomBtn(
                  title: 'Fund my wallet',
                  width: MediaQuery.of(context).size.width * 0.6,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  addCardBottom(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBuilder(
                text: 'Add your card here',
                color: kPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                hintText: 'Card number',
                enableSufix: false,
                inputType: TextInputType.number,
                textController: _cardNo,
              ),
              const SizedBox(height: 10.0),
              CustomTextField(
                hintText: 'Card holder name',
                enableSufix: false,
                textController: _holderName,
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Expiry Date',
                      enableSufix: false,
                      inputType: TextInputType.number,
                      textController: _expDate,
                    ),
                  ),
                  const SizedBox(width: 50.0),
                  Expanded(
                    child: CustomTextField(
                      hintText: 'CVV',
                      enableSufix: false,
                      inputType: TextInputType.number,
                      textController: _cvv,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Center(
                child: CustomBtn(
                  title: 'Submit',
                  width: MediaQuery.of(context).size.width * 0.6,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class MyCards extends StatefulWidget {
  const MyCards({Key? key}) : super(key: key);

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  int cardIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140,
          width: double.infinity,
          child: PageView.builder(
            itemCount: 4,
            controller: pageController,
            onPageChanged: (val) {
              setState(() {
                cardIndex = val;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 140,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff063578),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextBuilder(
                          text: 'xxxx xxxx xxxx 6743',
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(height: 5.0),
                        TextBuilder(
                          text: '25/05/2022',
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/icons/Mastercard-Logo.png',
                      height: 40,
                      width: 40,
                    )
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4,
            (index) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: cardIndex == index ? kPrimary : kWhiteShade,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 50.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextBuilder(
              text: 'Issuer Bank',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: kPrimary,
            ),
            TextBuilder(
              text: 'Guaranty Trust Bank',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff537CAA),
            )
          ],
        ),
        const SizedBox(height: 10.0),
        Divider(),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextBuilder(
              text: 'Added on',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: kPrimary,
            ),
            TextBuilder(
              text: 'May 25, 2020',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff537CAA),
            )
          ],
        ),
        const SizedBox(height: 10.0),
        Divider(),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextBuilder(
              text: 'Expiry Date',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: kPrimary,
            ),
            TextBuilder(
              text: '25/05/2024',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff537CAA),
            )
          ],
        ),
        const SizedBox(height: 10.0),
        Divider(),
        const SizedBox(height: 10.0),
        CustomBtn(
          title: 'Delete Card',
          bgColor: Color(0xffEB4359),
          onTap: () {},
        )
      ],
    );
  }
}
