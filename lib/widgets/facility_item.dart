import 'package:cozy_app/theme.dart';
import 'package:flutter/material.dart';

class FacilityItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int total;

  FacilityItem({this.name, this.imageUrl, this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
          height: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: '$total',
            children: [
              TextSpan(
                text: ' $name',
                style: subTitleTextStyle.copyWith(
                  color: greySubTextColor,
                  fontSize: 14,
                ),
              ),
            ],
            style: titleTextStyle.copyWith(
              fontSize: 14,
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
