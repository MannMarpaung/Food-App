part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({
    super.key,
    required this.paymentURL,
  });

  final String paymentURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Payment.png',
              width: 240,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(
                8.0,
              ),
              child: Text(
                'Finish Your Payment',
                style: blackFontStyle1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                'Please select your favourite\npayment method',
                style: greyFontStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                await launch(paymentURL);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
              ),
              child: Text(
                'Payment Method',
                style: blackFontStyle2.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(SuccessOrderPage(paymentURL: paymentURL));
              },
              child: Text(
                'Continue',
                style: blackFontStyle2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
