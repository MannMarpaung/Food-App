part of 'widgets.dart';

class CustomTabbar extends StatelessWidget {
  const CustomTabbar({
    super.key,
    required this.selectedIndex,
    required this.titles,
    this.onTap,
  });

  final int selectedIndex;
  final List<String> titles;
  final Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: 48,
            ),
            height: 1,
            color: "F2F2F2".toColor(),
          ),
          Row(
            children: titles
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(
                      left: defaultMargin,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            onTap!(titles.indexOf(e));
                          },
                          child: Text(
                            e,
                            style: (titles.indexOf(e) == selectedIndex)
                                ? blackFontStyle3
                                : greyFontStyle.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 3,
                          margin: const EdgeInsets.only(
                            top: 13,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                            color: (titles.indexOf(e) == selectedIndex)
                                ? "020202".toColor()
                                : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
