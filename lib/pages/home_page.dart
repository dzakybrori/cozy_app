import 'package:cozy_app/provider/space_provider.dart';
import 'package:flutter/material.dart';
import 'package:cozy_app/theme.dart';
import 'package:cozy_app/widgets/city_card.dart';
import 'package:cozy_app/widgets/space_card.dart';
import 'package:cozy_app/widgets/tips_card.dart';
import 'package:cozy_app/widgets/bottom_navbar_item.dart';
import 'package:cozy_app/models/city.dart';
import 'package:cozy_app/models/space.dart';
import 'package:cozy_app/models/tips.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

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
                  FutureBuilder(
                    future: spaceProvider.getRecommendedSpaces(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Space> data = snapshot.data;

                        return Column(
                          children:
                              data.map((item) => SpaceCard(item)).toList(),
                        );
                      } else {
                        return Center(
                          child: Column(
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        );
                      }
                    },
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
                      TipsCard(
                        Tips(
                          id: 1,
                          title: 'City Guidelines',
                          imageUrl: 'assets/images/icon_tips1.png',
                          updatedAt: '20 Apr',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TipsCard(
                        Tips(
                          id: 2,
                          title: 'Jakarta Fairship',
                          imageUrl: 'assets/images/icon_tips2.png',
                          updatedAt: '11 Dec',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 95,
                  ),
                  // NOTE: End of Recommended Space
                  // NOTE: Bottom NavBar
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * paddingEdge),
        margin: EdgeInsets.symmetric(horizontal: paddingEdge),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black12.withOpacity(0.06),
            borderRadius: BorderRadius.circular(23),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavbarItem(
                imageUrl: 'assets/images/icon_home.png',
                isActive: true,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/icon_mail.png',
                isActive: false,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/icon_card.png',
                isActive: false,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/icon_love.png',
                isActive: false,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
