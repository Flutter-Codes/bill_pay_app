import 'package:bill_pay/utils/custom_color.dart';
import 'package:bill_pay/view/login/phone_login.dart';
import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:flutter/material.dart';

class Walkthrough extends StatelessWidget {
  const Walkthrough({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(vertical: 50),
          child: SwipeCardView(),
        ),
      ),
    );
  }
}

class SwipeCardView extends StatefulWidget {
  const SwipeCardView({
    Key? key,
  }) : super(key: key);

  @override
  State<SwipeCardView> createState() => _SwipeCardViewState();
}

class _SwipeCardViewState extends State<SwipeCardView> {
  PageController _controller = PageController();
  int currentPage = 0;
  List<String> _images = [
    'assets/images/credit-card-illustrator.png',
    'assets/images/online-payments-illustrator.png',
    'assets/images/stripe-payments-illustrator.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 25),
            const SizedBox(width: 8.0),
            TextBuilder(
              text: 'Adikpo Pay',
              fontSize: 18,
              color: kPrimary,
              fontWeight: FontWeight.w900,
            ),
          ],
        ),
        const SizedBox(height: 90.0),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (val) {
                setState(() {
                  currentPage = val;
                });
              },
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      _images[index],
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    Spacer(),
                    TextBuilder(
                      text: 'Make easy payemnets on all\ntransaction',
                      fontSize: 16,
                      height: 1.4,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _images.length,
            (index) => Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: currentPage == index ? kPrimary : kWhiteShade,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 100.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PhoneLogin()));
              },
              child: SizedBox(
                width: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextBuilder(
                      text: 'Skip',
                      fontSize: 16,
                      color: kPrimary,
                    ),
                    Icon(
                      Icons.keyboard_double_arrow_right,
                      color: kPrimary,
                      size: 22,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
