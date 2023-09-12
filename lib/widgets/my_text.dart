import 'package:flutter/material.dart';

import '../extension/extensions.dart';

class MyText extends StatelessWidget {
  final String text;
  final int? maxLine;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final TextStyle? style;

  const MyText(
    this.text, {
    Key? key,
    this.style,
    this.maxLine,
    this.textAlign,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      softWrap: true,
      maxLines: maxLine,
      overflow: overflow,
      textAlign: textAlign,
      textScaleFactor: context.ts,
    );
  }
}

class MyRichText extends StatelessWidget {
  final String priceText;
  final String? subText;
  final double fontSize;

  const MyRichText(
      {Key? key, required this.priceText, this.fontSize = 16, this.subText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: priceText,
          children: [
            TextSpan(
                text: subText ?? ' / month',
                style: context.text.titleMedium?.copyWith(fontSize: fontSize))
          ],
          style: context.text.labelLarge?.copyWith(fontSize: fontSize)),
      maxLines: 1,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
    );
  }
}
