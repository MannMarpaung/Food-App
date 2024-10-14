part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar
            Container(
              width: 110,
              height: 110,
              margin: const EdgeInsets.only(
                top: 26.0,
              ),
              padding: const EdgeInsets.all(
                10.0,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/photo_border.png',
                  ),
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://ui-avatars.com/api/?name=Mann+Marpaung&background=random',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // User Name
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: defaultMargin,
              ),
              child: Column(
                children: [
                  Text(
                    'Mann Marpaung',
                    style: blackFontStyle1,
                  ),
                  Text(
                    'Email',
                    style: blackFontStyle2.copyWith(color: greyColor),
                  ),
                ],
              ),
            ),
            // Jarak Putih
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              color: Colors.white,
              height: 40,
              width: double.infinity,
            ),
            // CustomTabBar
            Container(
              padding: const EdgeInsets.fromLTRB(
                defaultMargin,
                defaultMargin,
                defaultMargin,
                0,
              ),
              child: Column(
                children: [
                  CustomTabbar(
                    selectedIndex: selectedIndex,
                    titles: const [
                      'Account',
                      'FoodMarker',
                    ],
                    onTap: (index) {
                      setState(
                        () {
                          selectedIndex = index;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  (selectedIndex == 0)
                      ? Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Edit Profile',
                                      style: blackFontStyle2,
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: Image.asset(
                                        'assets/right_arrow.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Home Address',
                                      style: blackFontStyle2,
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: Image.asset(
                                        'assets/right_arrow.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Security',
                                      style: blackFontStyle2,
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: Image.asset(
                                        'assets/right_arrow.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Payment',
                                      style: blackFontStyle2,
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: Image.asset(
                                        'assets/right_arrow.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        context.read<UserCubit>().signOut();
                                        Get.to(SignInPage());
                                      },
                                      child: Text(
                                        'Sign Out',
                                        style: blackFontStyle2,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: Image.asset(
                                        'assets/right_arrow.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
