import 'package:flutter/material.dart';
import 'package:cozy_app/theme.dart';
import 'package:cozy_app/widgets/city_card.dart';
import 'package:cozy_app/widgets/space_card.dart';
import 'package:cozy_app/widgets/tips_card.dart';
import 'package:cozy_app/models/city.dart';
import 'package:cozy_app/models/space.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: paddingEdge,
                left: paddingEdge,
                right: paddingEdge,
                bottom: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore Now',
                    style: titleTextStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Mencari kosan yang cozy',
                    style: subTitleTextStyle.copyWith(
                      fontSize: 16,
                      color: lightGreySubTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Popular Cities',
                    style: regulerTextStyle,
                  ),
                ],
              ),
            ),
            // NOTE: ListView Popular Cities
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/images/city1_jakarta.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/images/city2_bandung.png',
                      isFavorite: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'assets/images/city3_surabaya.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 4,
                      name: 'Palembang',
                      imageUrl: 'assets/images/city4_palembang.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 5,
                      name: 'Aceh',
                      imageUrl: 'assets/images/city5_aceh.png',
                      isFavorite: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 6,
                      name: 'Bogor',
                      imageUrl: 'assets/images/city6_bogor.png',
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            // NOTE: End of Popular Cities
            // NOTE: Recommended Space Section
            Padding(
              padding: EdgeInsets.only(
                left: paddingEdge,
                right: paddingEdge,
                top: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended Space',
                    style: regulerTextStyle,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: [
                      SpaceCard(
                        Space(
                          id: 1,
                          name: 'Kuretakeso Hott',
                          imageUrl: 'assets/images/space1.png',
                          price: 52.0,
                          city: 'Bandung',
                          country: 'Germany',
                          rating: 4,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SpaceCard(
                        Space(
                          id: 2,
                          name: 'Roemah Nenek',
                          imageUrl: 'assets/images/space2.png',
                          price: 11.0,
                          city: 'Seattle',
                          country: 'Bogor',
                          rating: 5,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SpaceCard(
                        Space(
                          id: 3,
                          name: 'Darrling How',
                          imageUrl: 'assets/images/space3.png',
                          price: 20.0,
                          city: 'Jakarta',
                          country: 'Indonesia',
                          rating: 3,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SpaceCard(
                        Space(
                          id: 4,
                          name: 'Orange Crown',
                          imageUrl: 'assets/images/space4.png',
                          price: 552.0,
                          city: 'Halla',
                          country: 'Sumatra',
                          rating: 5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Tips & Guidance',
                    style: regulerTextStyle,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: [
                      TipsCard(),
                      SizedBox(
                        height: 20,
                      ),
                      TipsCard(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
