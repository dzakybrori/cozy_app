import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../extension/extensions.dart';

class BottomNavbarItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final Color selectedItemColor;
  final Color unSelectedItemColor;

  BottomNavbarItem({
    required this.imageUrl,
    this.isActive = false,
    required this.selectedItemColor,
    required this.unSelectedItemColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.only(bottom: (isActive) ? 2 : 0),
          child: SvgPicture.asset(
            imageUrl,
            width: context.dp(30),
            color: isActive ? context.onSurface : context.disableColor,
          ),
        ),
        Spacer(),
        AnimatedScale(
          duration: Duration(milliseconds: 200),
          scale: (isActive) ? 1 : 0,
          child: Container(
            width: context.dp(30),
            height: context.dp(4),
            decoration: BoxDecoration(
              color: context.onSurface,
              borderRadius: BorderRadius.vertical(top: Radius.circular(1000)),
            ),
          ),
        ),
      ],
    );
  }
}
