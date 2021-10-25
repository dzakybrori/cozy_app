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
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
        title: 'Cozy App',
        themeMode: ThemeMode.system,
        theme: myLightTheme,
        darkTheme: myDarkTheme,
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
