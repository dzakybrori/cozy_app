import 'package:flutter/material.dart';
import 'package:cozy_app/theme.dart';
import 'package:cozy_app/models/space.dart';

class SpaceCard extends StatelessWidget {
  final Space space;

  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            width: 130,
            height: 110,
            child: Stack(
              children: [
                Image.asset(
                  space.imageUrl,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/icon_star_active.png',
                            width: 18,
                            height: 18,
                          ),
                          Text(
                            '${space.rating}/5',
                            style: btnTextStyle.copyWith(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              space.name,
              style: titleTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text.rich(
              TextSpan(
                text: '\$${space.price}',
                children: [
                  TextSpan(
                    text: ' / month',
                    style: subTitleTextStyle.copyWith(
                      color: greySubTextColor,
                      fontSize: 16,
                    ),
                  ),
                ],
                style: titleTextStyle.copyWith(
                  fontSize: 16,
                  color: primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              '${space.city}, ${space.country}',
              style: subTitleTextStyle.copyWith(
                fontSize: 14,
                color: greySubTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}