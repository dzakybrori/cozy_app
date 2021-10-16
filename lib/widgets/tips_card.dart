import 'package:flutter/material.dart';

import './my_text.dart';
import '../extension/extensions.dart';
import '../models/tips.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;

  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: context.dp(80),
          height: context.dp(80),
        ),
        SizedBox(width: context.dp(16)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(tips.title, style: context.text.bodyText1),
            MyText('Updated ${tips.updatedAt}',
                style: context.text.bodyText2?.copyWith(height: 1.7))
          ],
        ),
        Spacer(),
        IconButton(
            icon: Icon(Icons.chevron_right, color: context.disableColor),
            onPressed: () {}),
      ],
    );
  }
}
