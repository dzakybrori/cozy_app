import 'package:cozy_app/shared/shared_value.dart';
import 'package:cozy_app/widgets/my_text.dart';
import 'package:flutter/material.dart';

import '../extension/extensions.dart';

class SubHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String subTitle;
  final Color backgroundColor;
  final double extendedHeight;
  final double collapsedHeight;

  SubHeaderDelegate({
    required this.subTitle,
    this.backgroundColor = Colors.white,
    this.extendedHeight = 70,
    this.collapsedHeight = 60,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // print('SUB HEADER OFFSET: $shrinkOffset');
    return Material(
      elevation: (shrinkOffset > 20) ? 4 : 0,
      child: AnimatedContainer(
        color: backgroundColor,
        curve: Curves.easeInOutQuart,
        alignment:
            (shrinkOffset > 20) ? Alignment.bottomCenter : Alignment.bottomLeft,
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.only(
          left: context.dp(paddingEdge),
          right: context.dp(paddingEdge),
          bottom: context.dp(16),
        ),
        child: MyText(subTitle,
            style: context.text.subtitle2
                ?.copyWith(fontSize: (shrinkOffset > 20) ? 18 : 16)),
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
