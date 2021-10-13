import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './provider/space_provider.dart';
import './shared/theme.dart';
import './shared/shared_value.dart';
import './pages/error_page.dart';
import './pages/main_page.dart';
import './pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Set Device Orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      // DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
        title: 'Cozy App',
        theme: ThemeData(
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
          ).copyWith(
            primary: primarySwatch,
            primaryVariant: primarySwatch.shade800,
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17)),
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
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          RouteName.splashPage: (ctx) => SplashPage(key: Key('splash-page')),
          RouteName.mainPage: (ctx) => MainPage(key: Key('main-page')),
          RouteName.errorPage: (ctx) => ErrorPage(key: Key('error-page')),
        },
      ),
    );
  }
}
