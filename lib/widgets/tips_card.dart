import 'package:cozy_app/models/tips.dart';
import 'package:cozy_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;

  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: 80.r,
          height: 80.r,
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.title,
              style: titleTextStyle.copyWith(
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Updated ${tips.updatedAt}',
              style: subTitleTextStyle.copyWith(
                fontSize: 14.sp,
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
