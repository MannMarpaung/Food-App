part of 'widgets.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({
    super.key,
    this.food,
    this.itemWidth,
  });

  final Food? food;
  final double? itemWidth;

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
                  food?.picturePath ??
                      'https://ui-avatars.com/api/?name=${food?.name}&background=random',
                ),
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(
          width: itemWidth! - 182, //(80 + 12 + 90)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food?.name ?? 'No Name',
                style: blackFontStyle2,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                NumberFormat.currency(
                  symbol: 'IDR',
                  decimalDigits: 0,
                  locale: 'id-ID',
                ).format(food?.price),
                style: blackFontStyle2,
              ),
            ],
          ),
        ),
        RatingStars(
          rate: food?.rate,
        ),
      ],
    );
  }
}
