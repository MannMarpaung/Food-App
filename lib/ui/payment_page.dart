part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, required this.transaction});

  final Transaction transaction;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Payment',
      subtitle: 'You deseve better meal',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Header
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  Item Order Text
                Text(
                  'Item Orders',
                  style: blackFontStyle3.copyWith(
                    fontSize: 16,
                  ),
                ),
                //
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: <Widget>[
                    // Food Image
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            widget.transaction.food!.picturePath!,
                          ),
                        ),
                      ),
                    ),
                    //
                    const SizedBox(
                      width: 12.0,
                    ),
                    // Food
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 189,
                          child: Text(
                            widget.transaction.food!.name!,
                            style: blackFontStyle3,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                            symbol: 'IDR ',
                            decimalDigits: 0,
                            locale: 'id_ID',
                          ).format(
                            widget.transaction.food!.price,
                          ),
                          style: blackFontStyle3,
                        ),
                      ],
                    ),
                    // Many Items Text
                    Expanded(
                      child: Text(
                        '${widget.transaction.quantity} Item(s)',
                        textAlign: TextAlign.end,
                        style: greyFontStyle.copyWith(
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ],
                ),
                // Line
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                // Detail Transaction Text
                Text(
                  'Details Transaction',
                  style: blackFontStyle3.copyWith(
                    fontSize: 16.0,
                  ),
                ),
                //
                const SizedBox(
                  height: 12,
                ),
                // Name & Price
                Row(
                  children: <Widget>[
                    // Food Name
                    Text(
                      widget.transaction.food!.name!,
                      style: blackFontStyle3.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    //
                    const Spacer(),
                    // Food Price
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(widget.transaction.food!.price),
                    ),
                  ],
                ),
                //
                const SizedBox(
                  height: 12,
                ),
                // Quantity of Food
                Row(
                  children: <Widget>[
                    // Quantity Text
                    Text(
                      'Quantity',
                      style: blackFontStyle3,
                    ),
                    //
                    const Spacer(),
                    // Quantity Number
                    Text(
                      '${widget.transaction.quantity.toString()} item(s)',
                    ),
                  ],
                ),
                //
                const SizedBox(
                  height: 12,
                ),
                // Sub Total Price
                Row(
                  children: <Widget>[
                    // Sub Total Text
                    Text(
                      'Sub Total',
                      style: blackFontStyle3,
                    ),
                    //
                    const Spacer(),
                    // Sub Total Number
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(widget.transaction.total),
                    ),
                  ],
                ),
                // Line
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                //
                const SizedBox(
                  height: 12,
                ),
                // Tax 10% price
                Row(
                  children: <Widget>[
                    // Tax 10% Text
                    Text(
                      'Tax 10%',
                      style: blackFontStyle3,
                    ),
                    //
                    const Spacer(),
                    // Tax 10% Number
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(
                        widget.transaction.food!.price! *
                            widget.transaction.quantity! *
                            0.1,
                      ),
                    ),
                  ],
                ),
                //
                const SizedBox(
                  height: 12,
                ),
                // Driver Price
                Row(
                  children: <Widget>[
                    // Driver Text
                    Text(
                      'Driver',
                      style: blackFontStyle3,
                    ),
                    //
                    const Spacer(),
                    // Driver Price Number
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(50000),
                    ),
                  ],
                ),
                //
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                //
                const SizedBox(
                  height: 12,
                ),
                // TOTAL
                Row(
                  children: [
                    // TEXT
                    Text(
                      'Total',
                      style: blackFontStyle2,
                    ),
                    const Spacer(),
                    // NUMBER
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(
                        widget.transaction.total! +
                            widget.transaction.food!.price! *
                                widget.transaction.quantity! *
                                0.1 +
                            50000,
                      ),
                      style: blackFontStyle2,
                    ),
                  ],
                ),
                // // // //
                const SizedBox(
                  height: defaultMargin,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                // DELIVER TO
                Text(
                  'Deliver to:',
                  style: blackFontStyle2,
                ),
                //
                const SizedBox(
                  height: 12,
                ),
                // Nama Penerima
                Row(
                  children: <Widget>[
                    // User Text
                    Text(
                      'Nama Penerima',
                      style: blackFontStyle3,
                    ),
                    //
                    const Spacer(),
                    // User Name
                    Text(
                      widget.transaction.user?.name ?? '',
                      style: blackFontStyle3,
                    ),
                  ],
                ),
                //
                const SizedBox(
                  height: 6,
                ),
                // Email Penerima
                Row(
                  children: <Widget>[
                    // Email Text
                    Text(
                      'Email Penerima',
                      style: blackFontStyle3,
                    ),
                    //
                    const Spacer(),
                    // User Name
                    Text(
                      widget.transaction.user?.email ?? '',
                      style: blackFontStyle3,
                    ),
                  ],
                ),
                //
                const SizedBox(
                  height: 6,
                ),
                // Phone Number
                Row(
                  children: <Widget>[
                    // Email Text
                    Text(
                      'Phone Number',
                      style: blackFontStyle3,
                    ),
                    //
                    const Spacer(),
                    // User Name
                    Text(
                      widget.transaction.user?.phoneNumber ?? '',
                      style: blackFontStyle3,
                    ),
                  ],
                ),
                //
                const SizedBox(
                  height: 6,
                ),
                // House
                Row(
                  children: <Widget>[
                    // House Text
                    Text(
                      'House Number',
                      style: blackFontStyle3,
                    ),
                    //
                    const Spacer(),
                    // House User
                    Text(
                      widget.transaction.user?.houseNumber ?? '',
                      style: blackFontStyle3,
                    ),
                  ],
                ),
                //
                const SizedBox(
                  height: 6,
                ),
                // House
                Row(
                  children: <Widget>[
                    // City Text
                    Text(
                      'City Number',
                      style: blackFontStyle3,
                    ),
                    //
                    const Spacer(),
                    // City User
                    Text(
                      '${widget.transaction.user!.city}',
                      style: blackFontStyle3,
                    ),
                  ],
                ),

                Container(
                  width: double.infinity,
                  height: 45,
                  margin: const EdgeInsets.only(
                    top: 12,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        )),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      var paymentURL = await context
                          .read<TransactionCubit>()
                          .submitTransaction(
                            widget.transaction.copyWith(
                              dateTime: DateTime.now(),
                              total: widget.transaction.total! +
                                  (widget.transaction.food!.price! *
                                          widget.transaction.quantity! *
                                          0.1)
                                      .toInt() +
                                  50000,
                            ),
                          );

                      if (paymentURL != null) {
                        Get.to(PaymentMethodPage(paymentURL: paymentURL));
                      } else {
                        Get.snackbar(
                          "",
                          "",
                          backgroundColor: "D9435E".toColor(),
                          icon: const Icon(
                            MdiIcons.closeCircleOutline,
                            color: Colors.white,
                          ),
                          titleText: Text(
                            "Transaction Failed",
                            style: GoogleFonts.jost(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          messageText: Text(
                            "Please try again later",
                            style: GoogleFonts.jost(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Order Now',
                      style: blackFontStyle3.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
