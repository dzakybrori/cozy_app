import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../extension/extensions.dart';
import '../shared/shared_value.dart';
import '../widgets/my_text.dart';

class SplashPage extends StatelessWidget {
  static const String _title = 'Find Cozy House\nto Stay and Happy';
  static const String _subTitle =
      'Stop membuang banyak waktu\npada tempat yang tidak habitable';

  const SplashPage({Key? key}) : super(key: key);

  void _onClickExplore(BuildContext context) =>
      Navigator.pushNamed(context, RouteName.mainPage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            ..._backgroundImage(context),
            _bodyContent(context),
          ],
        ),
      ),
    );
  }

  Padding _bodyContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.h(50),
        left: context.dp(30),
        right: context.dp(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/svg/logo.svg',
              width: context.dp(50), fit: BoxFit.fitWidth),
          _titleSubTitleText(context),
          ElevatedButton(
              onPressed: () => _onClickExplore(context),
              child: MyText('Explore Now')),
        ],
      ),
    );
  }

  Container _titleSubTitleText(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.h(15), bottom: context.h(25)),
      padding: EdgeInsets.only(
          top: context.dp(8), bottom: context.dp(8), right: context.dp(8)),
      decoration: BoxDecoration(
        color: context.background.withOpacity(0.7),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(_title, style: context.text.titleLarge),
          SizedBox(height: context.h(10)),
          MyText(_subTitle, style: context.text.titleMedium),
        ],
      ),
    );
  }

  List<Widget> _backgroundImage(BuildContext context) => [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: context.h(289),
            width: double.infinity,
            color: context.secondaryColor,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset('assets/images/house.png', height: context.h(433)),
        )
      ];
}
