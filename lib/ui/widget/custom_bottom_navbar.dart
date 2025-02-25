part of 'widgets.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  final int selectedIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              0.1,
            ),
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(
              0,
              -2,
            ),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Home
          GestureDetector(
            onTap: () {
              onTap!(0);
                        },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/ic_home${(selectedIndex == 0) ? '.png' : '_normal.png'}',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // Order
          GestureDetector(
            onTap: () {
              onTap!(1);
                        },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/ic_order${(selectedIndex == 1) ? '.png' : '_normal.png'}',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // Profile
          GestureDetector(
            onTap: () {
              onTap!(2);
                        },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/ic_profile${(selectedIndex == 2) ? '.png' : '_normal.png'}',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
