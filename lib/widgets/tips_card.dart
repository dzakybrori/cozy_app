import 'package:cozy_app/theme.dart';
import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/icon_tips1.png',
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
              'City Guidelines',
              style: titleTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Updated 20 Apr',
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
