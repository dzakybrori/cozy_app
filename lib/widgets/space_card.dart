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
        )
      ],
    );
  }
}
