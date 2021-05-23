import 'package:cozy_app/theme.dart';
import 'package:cozy_app/widgets/facility_item.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/thumbnail.png',
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: paddingEdge,
                    vertical: 30,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kuretakeso Hott',
                                style: titleTextStyle.copyWith(
                                  fontSize: 22,
                                ),
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
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/icon_star_active.png',
                                width: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/images/icon_star_active.png',
                                width: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/images/icon_star_active.png',
                                width: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/images/icon_star_active.png',
                                width: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/images/icon_star_active.png',
                                width: 20,
                                color: Color(0XFF989BA1),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Main Facilities',
                        style: regulerTextStyle,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FacilityItem(
                            imageUrl: 'assets/images/icon_kitchen.png',
                            name: 'Kitchen',
                            total: 2,
                          ),
                          FacilityItem(
                            imageUrl: 'assets/images/icon_bedroom.png',
                            name: 'Bedroom',
                            total: 3,
                          ),
                          FacilityItem(
                            imageUrl: 'assets/images/icon_cupboard.png',
                            name: 'Big Lemari',
                            total: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Photos',
                        style: regulerTextStyle,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Location',
                        style: regulerTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: paddingEdge,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/images/btn_back.png',
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Image.asset(
                          'assets/images/btn_wishlist_inactive.png',
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
