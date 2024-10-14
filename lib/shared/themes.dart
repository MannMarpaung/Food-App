part of 'shared.dart';

const double defaultMargin = 24.0;

Color mainColor = "FFC700".toColor();
Color greyColor = "8D92A3".toColor();

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

TextStyle greyFontStyle = GoogleFonts.jost().copyWith(
  color: greyColor,
);
TextStyle blackFontStyle1 = GoogleFonts.jost().copyWith(
  color: Colors.black,
  fontSize: 22.0,
  fontWeight: FontWeight.w500,
);
TextStyle blackFontStyle2 = GoogleFonts.jost().copyWith(
  color: Colors.black,
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
);
TextStyle blackFontStyle3 = GoogleFonts.jost().copyWith(
  color: Colors.black,
  fontSize: 14.0,
  fontWeight: FontWeight.w300,
);
