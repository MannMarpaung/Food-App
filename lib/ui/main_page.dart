part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, this.initialPage = 0});

  final int initialPage;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;

  @override
  void initSelected() {
    super.initState();
    selectedPage = widget.initialPage;
    pageController = PageController(
      initialPage: widget.initialPage,
    );
  }

  PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Container(
            color: 'FAFAFC'.toColor(),
          ),
          SafeArea(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: const FoodPage(),
                ),
                const Center(
                  child: OrderHistoryPage(),
                ),
                const Center(
                  child: ProfilePage(),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavbar(
              selectedIndex: selectedPage,
              onTap: (int index) {
                setState(() {
                  selectedPage = index;
                });
                pageController.jumpToPage(selectedPage);
              },
            ),
          ),
        ],
      ),
    );
  }
}
