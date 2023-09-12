import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'shared/theme.dart';
import 'pages/main_page.dart';
import 'pages/error_page.dart';
import 'pages/splash_page.dart';
import 'shared/shared_value.dart';
import 'extension/extensions.dart';
import 'provider/space_provider.dart';
import 'provider/theme_provider.dart';

void main() async {
  await GetStorage.init();
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
        final _themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Cozy App',
          themeMode: _themeProvider.theme,
          theme: myLightTheme,
          darkTheme: myDarkTheme,
          debugShowCheckedModeBanner: false,
          routes: {
            RouteName.splashPage: (ctx) => SplashPage(key: Key('splash-page')),
            RouteName.mainPage: (ctx) => MainPage(key: Key('main-page')),
            RouteName.errorPage: (ctx) => ErrorPage(key: Key('error-page')),
          },
          builder: (context, child) {
            // Men-setting text scale factor Media Query.
            // Jika ini dihapus, maka text scale factor akan mengikuti System.
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaleFactor: context.textScale14),
              child: child!,
            );
          },
        );
      },
    );
  }
}
