import 'package:flutter/material.dart';
import 'package:cozy_app/theme.dart';
import 'package:cozy_app/models/tips.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;

  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: 80,
          height: 80,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.title,
              style: titleTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Updated ${tips.updatedAt}',
              style: subTitleTextStyle.copyWith(
                fontSize: 14,
                color: greySubTextColor,
              ),
            )
          ],
        ),
        Spacer(),
        IconButton(
            icon: Icon(
              Icons.chevron_right,
              color: Color(0XFFC9C9C9),
            ),
            onPressed: () {}),
      ],
    );
  }
}
