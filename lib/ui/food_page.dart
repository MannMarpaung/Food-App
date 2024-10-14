part of 'pages.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  void initState() {
    context.read<FoodCubit>().getFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;

    return ListView(
      children: <Widget>[
        // Header
        Container(
          color: Colors.white,
          height: 100,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Food Header Text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Food Market',
                    style: blackFontStyle1,
                  ),
                  Text(
                    "Let's get some food",
                    style: blackFontStyle2,
                  ),
                ],
              ),
              // Image Profile
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      (context.read<UserCubit>().state as UserLoaded)
                              .user
                              .picturePath ??
                          'https://ui-avatars.com/api/?name=${(context.read<UserCubit>().state as UserLoaded).user.name}&background=random',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Card Food
        Container(
          height: 220,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            vertical: defaultMargin,
          ),
          child: BlocBuilder<FoodCubit, FoodState>(
            builder: (_, state) => (state is FoodLoaded)
                ? ListView(
                    scrollDirection: Axis.horizontal,
                    children: state.food
                        .map(
                          (food) => Padding(
                            padding: EdgeInsets.only(
                                left: (food == state.food.first)
                                    ? defaultMargin
                                    : 0,
                                right: defaultMargin),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(DetailPage(
                                  onBackButtonPressed: () {
                                    Get.back();
                                  },
                                  transaction: Transaction(
                                    food: food,
                                    user: (context.read<UserCubit>().state
                                            as UserLoaded)
                                        .user,
                                  ),
                                ))!
                                    .then((value) {
                                  // method refresh
                                  value.onRefresh();
                                });
                              },
                              child: FoodCard(
                                food: food,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  )
                : const Center(),
          ),
        ),
        // Tab Layout
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              CustomTabbar(
                selectedIndex: selectedIndex,
                titles: const [
                  'New Taste',
                  'Popular',
                  'Recommended',
                ],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<FoodCubit, FoodState>(
                builder: (_, state) {
                  if (state is FoodLoaded) {
                    List<Food> foods = state.food
                        .where((e) => e.types!.contains((selectedIndex == 0)
                            ? FoodType.new_food
                            : (selectedIndex == 1)
                                ? FoodType.popular
                                : FoodType.recommended))
                        .toList();
                    return Column(
                      children: foods
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(
                                8.0,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(
                                    DetailPage(
                                      onBackButtonPressed: () {
                                        Get.back();
                                      },
                                      transaction: Transaction(
                                        food: e,
                                        user: (context.read<UserCubit>().state
                                                as UserLoaded)
                                            .user,
                                      ),
                                    ),
                                  );
                                },
                                child: FoodListItem(
                                  food: e,
                                  itemWidth: listItemWidth,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Center(
                      child: loadingIndicator,
                    );
                  }
                },
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
