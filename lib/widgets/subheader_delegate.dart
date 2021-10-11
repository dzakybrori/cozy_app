import 'package:flutter/material.dart';

import '../extension/extensions.dart';
import '../shared/theme.dart';

class SubHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String subTitle;
  final Color backgroundColor;
  final double extendedHeight;
  final double collapsedHeight;

  SubHeaderDelegate({
    required this.subTitle,
    this.backgroundColor = Colors.white,
    this.extendedHeight = 56,
    this.collapsedHeight = 50,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // print('SUB HEADER OFFSET: $shrinkOffset');
    return Material(
      elevation: (shrinkOffset > 6) ? 4 : 0,
      child: AnimatedContainer(
        color: backgroundColor,
        curve: Curves.easeInOutQuart,
        alignment:
            (shrinkOffset > 6) ? Alignment.bottomCenter : Alignment.bottomLeft,
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.only(
          left: context.dp(paddingEdge),
          right: context.dp(paddingEdge),
          bottom: context.dp(8),
        ),
        child: Text(subTitle,
            style: context.text.subtitle1
                ?.copyWith(fontSize: (shrinkOffset > 6) ? 18 : 16)),
      ),
    );
  }

  @override
  double get maxExtent => extendedHeight;

  @override
  double get minExtent => collapsedHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
