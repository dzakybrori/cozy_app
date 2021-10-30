import 'package:cozy_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './pages/error_page.dart';
import './pages/main_page.dart';
import './pages/splash_page.dart';
import './provider/space_provider.dart';
import './shared/shared_value.dart';
import './shared/theme.dart';

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>.value(value: ThemeProvider()),
          ChangeNotifierProvider<SpaceProvider>(
              create: (context) => SpaceProvider()),
        ],
        builder: (context, _) {
          final _themeProvider = Provider.of<ThemeProvider>(context).theme;
          return MaterialApp(
            title: 'Cozy App',
            themeMode: _themeProvider,
            theme: myLightTheme,
            darkTheme: myDarkTheme,
            debugShowCheckedModeBanner: false,
            routes: {
              RouteName.splashPage: (ctx) =>
                  SplashPage(key: Key('splash-page')),
              RouteName.mainPage: (ctx) => MainPage(key: Key('main-page')),
              RouteName.errorPage: (ctx) => ErrorPage(key: Key('error-page')),
            },
          );
        });
  }
}
