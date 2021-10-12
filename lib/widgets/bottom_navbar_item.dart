import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../extension/extensions.dart';

class BottomNavbarItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  BottomNavbarItem({required this.imageUrl, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        SvgPicture.asset(
          imageUrl,
          width: context.dp(30),
          color: isActive ? context.onSurface : context.disableColor,
        ),
        Spacer(),
        if (isActive)
          Container(
            width: context.dp(30),
            height: context.dp(4),
            decoration: BoxDecoration(
              color: context.onSurface,
              borderRadius: BorderRadius.vertical(top: Radius.circular(1000)),
            ),
          ),
      ],
    );
  }
}
