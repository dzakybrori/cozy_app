import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './shimmer_widget.dart';
import '../extension/extensions.dart';

class MyImageNetwork extends StatelessWidget {
  final String imgUrl;
  final double? width;
  final double? height;

  const MyImageNetwork(this.imgUrl, {Key? key, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imgUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return ShimmerWidget.rectangle(
            width: width ?? context.dw, height: height ?? context.dw);
      },
      errorBuilder: (context, error, stackTrace) => Container(
        width: width,
        height: height,
        color: context.surface,
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'assets/svg/logo.svg',
          width: context.dp(_getLogoSize()),
        ),
      ),
    );
  }

  double _getLogoSize() {
    if (width == null && height == null)
      return 100;
    else if (width! > height!)
      return height! / 2;
    else
      return width! / 2;
  }
}
