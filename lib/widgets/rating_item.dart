import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../extension/extensions.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;

  RatingItem({required this.index, required this.rating});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/icon_star.svg',
      width: context.dp(20),
      color: (index <= rating) ? Color(0XFFFF9376) : Color(0XFF989BA1),
    );
  }
}
