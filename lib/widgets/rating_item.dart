import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;

  RatingItem({this.index, this.rating});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/icon_star.png',
      width: 20.w,
      color: (index <= rating) ? Color(0XFFFF9376) : Color(0XFF989BA1),
    );
  }
}
