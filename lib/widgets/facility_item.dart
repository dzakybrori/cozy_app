import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './my_text.dart';
import '../extension/extensions.dart';

class FacilityItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int total;

  FacilityItem(
      {required this.name, required this.imageUrl, required this.total});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dp(60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(imageUrl,
              width: context.dp(32), height: context.dp(32)),
          SizedBox(height: context.dp(8)),
          Expanded(
              child: MyRichText(
                  priceText: '$total', subText: ' $name', fontSize: 14)),
        ],
      ),
    );
  }
}
