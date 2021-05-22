import 'package:flutter/material.dart';
import 'package:cozy_app/theme.dart';

class SpaceCard extends StatelessWidget {
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
                  'assets/images/space1.png',
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
                            '4/5',
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
              'Kuretakeso Hott',
              style: titleTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text.rich(
              TextSpan(
                text: '\$52',
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
              'Bandung, Germany',
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
