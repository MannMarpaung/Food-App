part of 'widgets.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({
    super.key,
    required this.transaction,
    required this.itemWidth,
  });

  final Transaction transaction;
  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 80,
          margin: const EdgeInsets.only(
            right: 12,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15,
              ),
              image: DecorationImage(
                image: NetworkImage(
                  transaction.food?.picturePath ??
                      'https://ui-avatars.com/api/?name=${transaction.food?.name}&background=random',
                ),
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(
          width: itemWidth - 182, //(80 + 12 + 90)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food?.name ?? 'No Name',
                style: blackFontStyle2,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                children: [
                  Text(
                    '${transaction.quantity} item(s) ~ ',
                    style: blackFontStyle2,
                  ),
                  Text(
                    NumberFormat.currency(
                      symbol: 'IDR',
                      decimalDigits: 0,
                      locale: 'id-ID',
                    ).format(
                      transaction.total,
                    ),
                    style: blackFontStyle2,
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                convertDateTimeDisplay(
                  transaction.dateTime!,
                ),
              ),
              (transaction.status == TransactionStatus.delivered)
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Delivered',
                            style: blackFontStyle2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Icon(
                            Icons.check,
                            size: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  : (transaction.status == TransactionStatus.canceled)
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Canceled',
                                style: blackFontStyle2.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const Icon(
                                Icons.close,
                                size: 20,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      : (transaction.status == TransactionStatus.pending)
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(
                                  12.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Pending',
                                    style: blackFontStyle2.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Icon(
                                    Icons.history,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(
                                  12.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'On Delivery',
                                    style: blackFontStyle2.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Icon(
                                    Icons.directions_bike,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
            ],
          ),
        ),
      ],
    );
  }
}
