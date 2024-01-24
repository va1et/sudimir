import 'package:flutter/material.dart';
import 'package:agro_hack23/common/theme/colors.dart';

abstract class CustomTextTheme {
  static const xLargeTitleNS = TextStyle(
    fontSize: 44,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    //height: 48,
    letterSpacing: 0.37,
  );
  static const xLargeTitleMS = TextStyle(
    fontSize: 64,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    // height: 69,
    letterSpacing: 0.22,
  );
  static const largeTitleNS = TextStyle(
    fontSize: 34,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    // //height: 40,
    letterSpacing: 0.4,
  );
  static const largeTitleMS = TextStyle(
    fontSize: 60,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    //height: 70,
    letterSpacing: 0.26,
  );

  static const title1NS = TextStyle(
    fontSize: 30,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    //height: 32,
    letterSpacing: 0.4,
  );
  static const title1MS = TextStyle(
    fontSize: 56,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    //height: 59,
    letterSpacing: 0.3,
  );

  static const title2NS = TextStyle(
    fontSize: 28,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    //height: 32,
    letterSpacing: 0.38,
  );
  static const title2MS = TextStyle(
    fontSize: 56,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    //height: 64,
    letterSpacing: 0.3,
  );

  static const title3NS = TextStyle(
    fontSize: 20,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    //height: 24,
    letterSpacing: -0.05,
  );
  static const title3MS = TextStyle(
    fontSize: 48,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    //height: 57,
    letterSpacing: 0.35,
  );

  static const headline1NS = TextStyle(
    fontSize: 18,
    fontFamily: 'SF Pro-Text',
    fontWeight: FontWeight.w600,
    //height: 24,
    letterSpacing: -0.44,
  );
  static const headline1MS = TextStyle(
    fontSize: 44,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w600,
    //height: 58,
    letterSpacing: 0.37,
  );

  static const headline2NS = TextStyle(
    fontSize: 16,
    fontFamily: 'SF Pro-Text',
    fontWeight: FontWeight.w700,
    //height: 20,
    letterSpacing: -0.31,
  );
  static const headline2MS = TextStyle(
    fontSize: 40,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    //height: 50,
    letterSpacing: 0.37,
  );

  static const bodyNS = TextStyle(
    fontSize: 16,
    fontFamily: 'SF Pro-Text',
    fontWeight: FontWeight.w400,
    //height: 20,
    letterSpacing: -0.31,
  );
  static const bodyMS = TextStyle(
    fontSize: 40,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    //height: 50,
    letterSpacing: 0.37,
  );
  static const bodyButtonNS = TextStyle(
    fontSize: 16,
    fontFamily: 'SF Pro-Text',
    fontWeight: FontWeight.w400,
    //height: 20,
    letterSpacing: -0.31,
  );
  static const bodyButtonMS = TextStyle(
    fontSize: 40,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    //height: 50,
    letterSpacing: 0.38,
  );

  static const subheadlineNS = TextStyle(
    fontSize: 14,
    fontFamily: 'SF Pro-Text',
    fontWeight: FontWeight.w600,
    //height: 20,
    letterSpacing: -0.15,
  );
  static const subheadlinetMS = TextStyle(
    fontSize: 32,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w600,
    //height: 45,
    letterSpacing: 0.41,
  );
  static const subheadlineButtonNS = TextStyle(
    fontSize: 14,
    fontFamily: 'SF Pro-Text',
    fontWeight: FontWeight.w600,
    //height: 20,
    letterSpacing: -0.15,
  );
  static const subheadlineButtonMS = TextStyle(
    fontSize: 28,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w600,
    //height: 40,
    letterSpacing: 0.38,
  );

  static const calloutNS = TextStyle(
    fontSize: 14,
    fontFamily: 'SF Pro-Text',
    fontWeight: FontWeight.w400,
    //height: 2,
    letterSpacing: -0.15,
  );
  static const calloutMS = TextStyle(
    fontSize: 32,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    //height: 45,
    letterSpacing: 0.41,
  );
  static const calloutButtonNS = TextStyle(
    fontSize: 14,
    fontFamily: 'SF Pro-Text',
    fontWeight: FontWeight.w400,
    //height: 20,
    letterSpacing: -0.15,
  );
  static const calloutButtonMS = TextStyle(
    fontSize: 28,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    //height: 40,
    letterSpacing: 0.38,
  );

  static const footnoteNS = TextStyle(
    fontSize: 12,
    fontFamily: 'SF Pro-Text',
    fontWeight: FontWeight.w400,
    //height: 16,
    letterSpacing: 0.0,
  );
  static const footnoteMS = TextStyle(
    fontSize: 20,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    //height: 26,
    letterSpacing: -0.45,
  );
  static const caption2NS = TextStyle(
    fontSize: 11,
    fontFamily: 'SF Pro-Text',
    fontWeight: FontWeight.w600,
    //height: 12,
    letterSpacing: 0.06,
  );
  static const caption2MS = TextStyle(
    fontSize: 16,
    fontFamily: 'SF Pro-Text',
    fontWeight: FontWeight.w600,
    //height: 17,
    letterSpacing: -0.31,
  );
  static const caption1NS = TextStyle(
    fontSize: 11,
    fontFamily: 'SF Pro-Text',
    fontWeight: FontWeight.w400,
    //height: 12,
    letterSpacing: 0.06,
  );
  static const caption1MS = TextStyle(
    fontSize: 16,
    fontFamily: 'SF Pro-Text Regular',
    fontWeight: FontWeight.w400,
    //height: 17,
    letterSpacing: -0.31,
  );
}

final appTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: CustomThemeColors.backgroundMain,
  cardColor: CustomThemeColors.card,
  primaryColor: CustomThemeColors.maincolor,
  disabledColor: CustomThemeColors.deactive,
  focusColor: CustomThemeColors.text,
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    titleTextStyle: CustomTextTheme.calloutButtonNS,
  ),
);
