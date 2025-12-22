import 'package:flutter/material.dart';

mixin KColors {
  static const Color red = Color(0xffE80206);
  static const Color brown = Color(0xffEB5757);
  // static const Color purple = Color(0xff6F76E9);
  static const Color white = Color(0xffFFFFFF);
  // static const Color background = Color(0xff25676E);
  static const Color grey = Color(0xFFA7A7A7);
  static const Color darkGreen = Color(0xFF14561D);
  static const Color lightGreen = Color(0xFF88982c);
  static const Color formBorderColor = Color(0xFFDAFFDC);
  static const Color lightestGreen = Color(0xFF1FA030);
  static const Color gridGreen = Color(0xFFE2EDA5);
  static const Color tileBackgroundColor = Color(0xFFF4F5F7);
  static const Color mehroom = Color(0xffC10037);
  static const Color searchbarColor = Color(0xff785F2A);

  static const Color lightSearchbarColor = Color(0xFFC3A970);
  // static const Color scaffoldColor = Color(0xFF212233);
  // static const Color blue = Color(0xFF05AAED);
  static const Color yellow = Color.fromARGB(255, 255, 200, 18);
  // static const Color lightGrey = Color(0xFF2A2B42);
  static const Color persistentBlack = Color(0xff0F0F0F);

  static const Color borderColor = Color(0xffE8D3A8);
  static const Color buttonColor = Color(0xff8A6602);
  static const Color buttonColorBackgroundColor = Color(0xff59503B);
  static const Color goldColor = Color(0xffDAB34A);
  static const Color widgetBackgroundColor = Color(0xffF2F4F8);
  static const Color orange = Color(0xffF29322);
  static const Color lightPink = Color(0xffFFF5F9);
  static const Color textPurpleColor = Color(0xff862C6A);
  static const Color vanila = Color(0xffE2D2B2);
  // static const Color textGreyColor = Color(0xff333333);
  static const Color pinkColor = Color(0xffFF0097);
  static const Color textGreyColor = Color(0xff333333);
  static const Color background = Color(0xff000000);
  static const Color purpleColor = Color(0xff6515A3);
  // static const Color silverColor = Color(0xffC0C0C0);
  // static const Color goldColor = Color(0xffFFD700);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
