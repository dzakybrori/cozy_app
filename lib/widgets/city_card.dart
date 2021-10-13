import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './my_text.dart';
import '../extension/extensions.dart';
import '../models/city.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: context.dp(150),
        width: context.dp(120),
        color: context.surface,
        child: Material(
          color: Colors.transparent,
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(milliseconds: 500),
                content: Text('${city.name} City Clicked'))),
            enableFeedback: true,
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(city.imageUrl,
                        height: context.dp(102), fit: BoxFit.cover),
                    if (city.isFavorite) _buildFavSign(context),
                  ],
                ),
                _buildCityName(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildCityName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.h(11),
        bottom: context.h(13),
        left: context.dp(13),
        right: context.dp(13),
      ),
      child: FittedBox(
        child: MyText(city.name,
            maxLine: 1,
            textAlign: TextAlign.center,
            style: context.text.bodyText1?.copyWith(fontSize: 16)),
      ),
    );
  }

  Align _buildFavSign(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: context.dp(50),
        height: context.dp(30),
        decoration: BoxDecoration(
            color: context.primaryColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
        child: Padding(
          padding: EdgeInsets.only(
            left: context.dp(17),
            right: context.dp(11),
            top: context.dp(2),
            bottom: context.dp(6),
          ),
          child: Center(
              child: SvgPicture.asset(
            'assets/svg/icon_star.svg',
            color: context.secondaryColor,
            width: context.dp(22),
            height: context.dp(22),
          )),
        ),
      ),
    );
  }
}
