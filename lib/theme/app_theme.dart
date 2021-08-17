import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static bool isDarkMode=false;
  static const Color light_white = Color(0xFFf0f0f0);
  static const Color white = Color(0xFFFFFFFF);
  static  Color background = Color.fromRGBO(249,209,33,1);
  static  Color disableColor = Color.fromRGBO(237,237,237,1);
  static Color darkText;
  static Color darkerText;
  static Color lightText;
  static MaterialColor myAppColor = const MaterialColor(0xFFFFAC30,
      const {
        50 : const Color.fromRGBO(249,209,33,1),
        100 : const Color.fromRGBO(249,209,33,1),
        200 : const Color.fromRGBO(249,209,33,1),
        300 : const Color.fromRGBO(249,209,33,1),
        400 : const Color.fromRGBO(249,209,33,1),
        500 : const Color.fromRGBO(249,209,33,1),
        600 : const Color.fromRGBO(249,209,33,1),
        700 : const Color.fromRGBO(249,209,33,1),
        800 : const Color.fromRGBO(249,209,33,1),
        900 : const Color.fromRGBO(249,209,33,1),}
        );
  static Color spacer;
  static Color appColor;
  static Color selectedColor=Color(0xFFFFE8DF);
  static Color black_app_color;
  static Color white_app_color;
  static Color white_black_color;
  static Color light_black_white_color;
  static Color ticket_color;
  static Color transparent = Color(0x00FFFFFF);
  static Color green = Color(0xFF299E00);
//  static Color splash_b = Color(0x00e5e5e5);
  static Color statusBarColor ;

  static init(bool darkMode)
  {
    isDarkMode=darkMode;
    background=darkMode?Color.fromRGBO(242,100,43,0.7):Color.fromRGBO(242,100,43,0.7);
    darkText=darkMode?Color(0xFFFFFFFF):Color(0xFF253840);
    darkerText=darkMode?Color(0xFFFFFFFF):Color(0xFF17262A);
    lightText=darkMode?Color(0xFFFFFFFF):Color(0xFF4A6572);
    spacer=darkMode?Color(0xFF202020):Color(0xFFE5E5E5);
    appColor=darkMode?HexColor("#FFAC30"):HexColor("#FFAC30");
    statusBarColor=darkMode?Color(0xFF17262A):Colors.black;
    black_app_color=darkMode?Color(0xFF000000):HexColor("#FFAC30");
    white_app_color=darkMode?Color(0xFFFFFFFF):HexColor("#FFAC30");
    white_black_color=darkMode?Color(0xFFFFFFFF):Color(0xFF000000);
    light_black_white_color=darkMode?Color(0xFF202020):Color(0xFFFFFFFF);
    ticket_color=darkMode?Color(0xFFFFCB2A):Color(0xFFFFCB2A);
  }



//  const LinearGradient mainButton = LinearGradient(colors: [
//    Color.fromRGBO(236, 60, 3, 1),
//    Color.fromRGBO(234, 60, 3, 1),
//    Color.fromRGBO(216, 78, 16, 1),
//  ], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);
//
//  const List<BoxShadow> shadow = [
//    BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
//  ];

  screenAwareSize(int size, BuildContext context) {
    double baseHeight = 640.0;
    return size * MediaQuery.of(context).size.height / baseHeight;
  }
//  static  ThemeData themeData= ThemeData(
//      brightness:     Brightness.light,
//      primaryColor:   appColor,
//      accentColor:    appColor,
////      primarySwatch: Colors.green,
//      visualDensity: VisualDensity.adaptivePlatformDensity,
//      fontFamily: 'WorkSans',
//      textTheme: textTheme
//  );
  static TextStyle headline1 = TextStyle(
    fontFamily: "Segoe",
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
  );

  static TextStyle headline2 = TextStyle(
    fontFamily: "Segoe",
    fontWeight: FontWeight.w600,
    fontSize: 24,
    letterSpacing: 0.27,
  );
  static TextStyle headline3 = TextStyle(
    fontFamily: "Segoe",
    fontWeight: FontWeight.w300,
    fontSize: 14,
  );

  static TextStyle title = TextStyle(
    /// bold text
    fontFamily: "Segoe",
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
  );
  static TextStyle button_title = TextStyle(
    /// semi bold
    fontFamily: "Segoe",
    fontWeight: FontWeight.w600,
    fontSize: 18,
    letterSpacing: 0.18,
  );

  static TextStyle subtitle = TextStyle(
    /// SemiBold Text
    fontFamily: "Segoe",
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle body2 = TextStyle(
    fontFamily: "Segoe",
    fontSize: 14,
    letterSpacing: 0.2,
    fontWeight: FontWeight.w400,
  );

  static TextStyle body1 = TextStyle(
    fontFamily: "Segoe",
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.05,
  );

  static TextStyle caption = TextStyle(
    /// normal text
    fontFamily: "Segoe",
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.2,
  );
  static TextStyle lable = TextStyle(

      /// Medium Text
      color: Colors.black45,
      fontFamily: "Segoe",
      fontWeight: FontWeight.w500,
      fontSize: 14.0);

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
      init(isDarkTheme);
      TextTheme textTheme = TextTheme(
        headline1: headline1,
        headline2: headline2,
        headline3: headline3, /// light text
        subtitle1: title,     /// bold text
        subtitle2: subtitle,  /// semi bold
        bodyText1: body1,
        bodyText2: body2, /// label
        caption: caption,  /// caption
      );

    return ThemeData(
      primarySwatch: myAppColor,
      primaryColor: isDarkTheme ? Colors.black : appColor,

      backgroundColor: isDarkTheme ? Colors.black : Colors.white,

      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),

      hintColor: isDarkTheme ? Color(0xff280C0B) : Colors.black,

      highlightColor: isDarkTheme ? Color(0xFFFFFFFF) : Color(0x22F16A36),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
//      iconTheme: IconTheme(data: IconThemeData(), child: null),
      focusColor: isDarkTheme ? Color(0xff0B2512) : HexColor("#FFAC30"),
      disabledColor: Colors.grey,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF151515) : HexColor("#FFAC30"),
      canvasColor: isDarkTheme ? Colors.black : Colors.white,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
      textTheme: textTheme,
    );

  }

}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }


}
