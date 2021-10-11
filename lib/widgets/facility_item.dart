import 'package:cozy_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FacilityItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int total;

  FacilityItem(
      {required this.name, required this.imageUrl, required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 38.r,
          height: 38.r,
        ),
        SizedBox(height: 8.h),
        Text.rich(
          TextSpan(
            text: '$total',
            children: [
              TextSpan(
                text: ' $name',
                style: subTitleTextStyle.copyWith(
                  color: greySubTextColor,
                  fontSize: 14.sp,
                ),
              ),
            ],
            style: titleTextStyle.copyWith(
              fontSize: 16.sp,
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
