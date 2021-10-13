import 'package:animations/animations.dart';
import 'package:cozy_app/pages/home_page.dart';
import 'package:flutter/material.dart';

import './error_page.dart';
import '../extension/extensions.dart';
import '../widgets/custom_navbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Bottom Navigation Bar Value
  int _selectedIndex = 0;
  List<String> icons = [
    'assets/svg/icon_home.svg',
    'assets/svg/icon_mail.svg',
    'assets/svg/icon_card.svg',
    'assets/svg/icon_love.svg',
  ];

  List<Widget> pages = [
    HomePage(key: Key('Main-0')),
    ErrorPage(
      key: Key('Main-1'),
      useButton: false,
      errorTitle: 'Inbox Message',
      errorSubTitle: 'You didn\'t have any message yet',
    ),
    ErrorPage(
      key: Key('Main-2'),
      useButton: false,
      errorTitle: 'Booked Space History',
      errorSubTitle: 'Start booked and enjoy the facilities.',
    ),
    ErrorPage(
      key: Key('Main-3'),
      useButton: false,
      errorTitle: 'Wishes Space',
      errorSubTitle: 'Don\'t you have any fav space?.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: _bottomNavBar(),
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      bottom: false,
      child: PageTransitionSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child),
        child: pages[_selectedIndex],
      ),
    );
  }

  Widget _bottomNavBar() {
    return CustomNavBar(
      icons: icons,
      onTap: (value) => setState(() => _selectedIndex = value),
      selectedIndex: _selectedIndex,
      selectedItemColor: context.onSurface,
      unSelectedItemColor: context.disableColor,
    );
  }
}
