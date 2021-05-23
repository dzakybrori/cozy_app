import 'package:cozy_app/theme.dart';
import 'package:cozy_app/widgets/facility_item.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final List<String> photos = <String>[
    'assets/images/photo1.png',
    'assets/images/photo2.png',
    'assets/images/photo3.png',
    'assets/images/photo4.png',
    'assets/images/photo5.png',
  ];

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
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 30,
                          left: paddingEdge,
                          right: paddingEdge,
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
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                      // NOTE: PHOTOS SECTION
                      Container(
                        height: 88,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: photos.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: (index == 0) ? paddingEdge : 0,
                                right: (index == (photos.length - 1))
                                    ? paddingEdge
                                    : 18,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  photos[index],
                                  width: 110,
                                  height: 88,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      // END OF PHOTOS SECTION
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
