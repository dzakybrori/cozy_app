import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import './shared_method.dart';

Color primaryColor = Color(0XFF5843BE);
Color secondaryColor = Color(0XFFFF9376);
Color lightBackgroundColor = Color(0XFFFEFEFE);
Color errorColor = Color(0XFFFF5B5B);
Color surfaceColor = Color(0XFFF0F0F0);
// Dark Theme Color
Color darkBackgroundColor = Color(0XFF1E1E1E);
Color darkSurfaceColor = Color(0XFF393939);

MaterialColor primarySwatch = generateMaterialColor(primaryColor);
MaterialColor secondarySwatch = generateMaterialColor(secondaryColor);

ThemeData myLightTheme = ThemeData(
  fontFamily: 'Poppins',
  backgroundColor: lightBackgroundColor,
  scaffoldBackgroundColor: lightBackgroundColor,
  hintColor: Colors.black54,
  disabledColor: Colors.black38,
  primarySwatch: primarySwatch,
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
        transitionType: SharedAxisTransitionType.horizontal),
    TargetPlatform.android: SharedAxisPageTransitionsBuilder(
        transitionType: SharedAxisTransitionType.horizontal),
  }),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: primarySwatch,
    accentColor: secondarySwatch,
    errorColor: errorColor,
    backgroundColor: lightBackgroundColor,
    brightness: Brightness.light,
  ).copyWith(
    primary: primarySwatch,
    secondary: secondarySwatch,
    surface: surfaceColor,
    onSurface: primarySwatch.shade400,
    onPrimary: lightBackgroundColor,
    onError: lightBackgroundColor,
    onBackground: Colors.black87,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: primaryColor,
      onPrimary: lightBackgroundColor,
      fixedSize: const Size(210, 50),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
    ),
  ),
  textTheme: TextTheme(
    headline6: TextStyle(
      fontSize: 24,
      letterSpacing: 0,
      color: Colors.black87,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      letterSpacing: 0,
      color: Colors.black54,
      fontWeight: FontWeight.w300,
      overflow: TextOverflow.ellipsis,
    ),
    subtitle2: TextStyle(
      fontSize: 16,
      letterSpacing: 0,
      color: Colors.black87,
      fontWeight: FontWeight.normal,
      overflow: TextOverflow.ellipsis,
    ),
    bodyText1: TextStyle(
      fontSize: 18,
      letterSpacing: 0,
      color: Colors.black87,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      letterSpacing: 0,
      color: Colors.black54,
      // Sometimes value change to normal
      fontWeight: FontWeight.w300,
      overflow: TextOverflow.ellipsis,
    ),
    caption: TextStyle(
      height: 1.7,
      fontSize: 13,
      letterSpacing: 0,
      color: lightBackgroundColor,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    ),
    button: TextStyle(
      fontSize: 16,
      letterSpacing: 0,
      height: 1.7,
      color: primaryColor,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    ),
  ),
);

ThemeData myDarkTheme = ThemeData(
  fontFamily: 'Poppins',
  backgroundColor: darkBackgroundColor,
  scaffoldBackgroundColor: darkBackgroundColor,
  hintColor: Colors.white60,
  disabledColor: Colors.white38,
  primarySwatch: primarySwatch,
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
        transitionType: SharedAxisTransitionType.horizontal),
    TargetPlatform.android: SharedAxisPageTransitionsBuilder(
        transitionType: SharedAxisTransitionType.horizontal),
  }),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: primarySwatch,
    accentColor: secondarySwatch,
    errorColor: errorColor,
    backgroundColor: darkBackgroundColor,
    brightness: Brightness.dark,
  ).copyWith(
    primary: primarySwatch.shade700,
    secondary: secondarySwatch,
    surface: darkSurfaceColor,
    onSurface: primarySwatch.shade400,
    onPrimary: lightBackgroundColor,
    onError: lightBackgroundColor,
    onBackground: Colors.white.withOpacity(0.87),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: primarySwatch.shade700,
      onPrimary: lightBackgroundColor,
      fixedSize: const Size(210, 50),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
    ),
  ),
  textTheme: TextTheme(
    headline6: TextStyle(
      fontSize: 24,
      letterSpacing: 0,
      color: Colors.white.withOpacity(0.87),
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      letterSpacing: 0,
      color: Colors.white60,
      fontWeight: FontWeight.w300,
      overflow: TextOverflow.ellipsis,
    ),
    subtitle2: TextStyle(
      fontSize: 16,
      letterSpacing: 0,
      color: Colors.white.withOpacity(0.87),
      fontWeight: FontWeight.normal,
      overflow: TextOverflow.ellipsis,
    ),
    bodyText1: TextStyle(
      fontSize: 18,
      letterSpacing: 0,
      color: Colors.white.withOpacity(0.87),
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      letterSpacing: 0,
      color: Colors.white60,
      // Sometimes value change to normal
      fontWeight: FontWeight.w300,
      overflow: TextOverflow.ellipsis,
    ),
    caption: TextStyle(
      height: 1.7,
      fontSize: 13,
      letterSpacing: 0,
      color: lightBackgroundColor,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    ),
    button: TextStyle(
      fontSize: 16,
      letterSpacing: 0,
      height: 1.7,
      color: primarySwatch.shade400,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    ),
  ),
);
