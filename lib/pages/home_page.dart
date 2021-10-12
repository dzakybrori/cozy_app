import 'package:cozy_app/shared/shared_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../models/space.dart';
import '../provider/space_provider.dart';
import '../shared/theme.dart';
import '../widgets/bottom_navbar_item.dart';
import '../widgets/city_card.dart';
import '../widgets/space_card.dart';
import '../widgets/tips_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: paddingEdge.w,
                left: paddingEdge.w,
                right: paddingEdge.w,
                bottom: 16.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore Now',
                    style: titleTextStyle.copyWith(
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Mencari kosan yang cozy',
                    style: subTitleTextStyle.copyWith(
                      fontSize: 16.sp,
                      color: lightGreySubTextColor,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Popular Cities',
                    style: regulerTextStyle,
                  ),
                ],
              ),
            ),
            // NOTE: ListView Popular Cities
            Container(
              height: 175.r,
              child: ListView.builder(
                itemCount: mCityList.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                      right: (index != (mCityList.length - 1)) ? 20.w : 0),
                  child: CityCard(mCityList[index]),
                ),
              ),
            ),
            // NOTE: End of Popular Cities
            // NOTE: Recommended Space Section
            Padding(
              padding: EdgeInsets.only(
                left: paddingEdge.w,
                right: paddingEdge.w,
                top: 30.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended Space',
                    style: regulerTextStyle,
                  ),
                  SizedBox(height: 16.h),
                  FutureBuilder<List<Space>>(
                    future: spaceProvider.getRecommendedSpaces(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Space> data = snapshot.data!;

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(bottom: 30.h),
                            child: SpaceCard(data[index]),
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: 200.h,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  ),
                  Text(
                    'Tips & Guidance',
                    style: regulerTextStyle,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: mTipsList.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(
                        top: (index == 0) ? 16.h : 0,
                        bottom:
                            (index == (mTipsList.length - 1)) ? 110.h : 20.h,
                      ),
                      child: TipsCard(mTipsList[index]),
                    ),
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
        height: 65.h,
        width: MediaQuery.of(context).size.width - (2 * paddingEdge.w),
        margin: EdgeInsets.symmetric(horizontal: paddingEdge.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(23.w),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black12.withOpacity(0.06),
            borderRadius: BorderRadius.circular(23.w),
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
