import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../extension/extensions.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadiusGeometry? borderRadius;
  final BoxShape shape;

  const ShimmerWidget(
      {Key? key,
      required this.width,
      required this.height,
      this.borderRadius,
      this.shape = BoxShape.rectangle})
      : super(key: key);

  const ShimmerWidget.rectangle(
      {required this.width,
      required this.height,
      this.borderRadius,
      this.shape = BoxShape.rectangle});

  const ShimmerWidget.rounded(
      {required this.width,
      required this.height,
      required this.borderRadius,
      this.shape = BoxShape.rectangle});

  const ShimmerWidget.circle(
      {required this.width,
      required this.height,
      this.borderRadius,
      this.shape = BoxShape.circle});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.disableColor.withOpacity(0.28),
      highlightColor: context.disableColor.withOpacity(0.1),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: context.disableColor.withOpacity(0.28),
          shape: shape,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
