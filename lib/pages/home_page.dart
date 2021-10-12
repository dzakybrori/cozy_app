import 'package:cozy_app/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../extension/extensions.dart';
import '../models/space.dart';
import '../provider/space_provider.dart';
import '../shared/shared_value.dart';
import '../shared/theme.dart';
import '../widgets/bottom_navbar_item.dart';
import '../widgets/city_card.dart';
import '../widgets/space_card.dart';
import '../widgets/tips_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _title = 'Explore Now';
  static const _subTitle = 'Mencari kosan yang cozy';

  static const List<String> _subHeader = [
    'Popular Cities',
    'Recommended Space',
    'Tips & Guidance'
  ];

  late SpaceProvider _spaceProvider;

  @override
  void initState() {
    super.initState();
    _spaceProvider = Provider.of<SpaceProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            _buildHeader(),
            _buildSubHeader(_subHeader[0]),
            _buildPopularCities(),
            _buildSubHeader(_subHeader[1]),
            _buildRecommendedSpaces(),
            _buildSubHeader(_subHeader[2]),
          ],
        ),
      ),
      floatingActionButton: _buildBottomNav(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  SliverPadding _buildHeader() => SliverPadding(
        padding:
            EdgeInsets.only(top: context.dp(30), left: context.dp(paddingEdge)),
        sliver: SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(_title, style: context.text.headline6),
              MyText(_subTitle, style: context.text.subtitle1),
            ],
          ),
        ),
      );

  SliverPadding _buildSubHeader(String title) => SliverPadding(
        padding: EdgeInsets.only(
          top: context.dp(30),
          left: context.dp(paddingEdge),
          bottom: context.dp(16),
        ),
        sliver: SliverToBoxAdapter(
            child: MyText(title, maxLine: 1, style: context.text.subtitle2)),
      );

  SliverToBoxAdapter _buildPopularCities() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: context.dp(150),
        child: ListView.builder(
          itemCount: mCityList.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: context.dp(paddingEdge)),
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(left: (index > 0) ? context.dp(20) : 0),
            child: CityCard(mCityList[index]),
          ),
        ),
      ),
    );
  }

  SliverPadding _buildRecommendedSpaces() => SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: context.dp(paddingEdge)),
        sliver: FutureBuilder<List<Space>>(
          future: _spaceProvider.getRecommendedSpaces(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Space> data = snapshot.data!;

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding:
                        EdgeInsets.only(top: (index > 0) ? context.dp(30) : 0),
                    child: SpaceCard(data[index]),
                  ),
                  childCount: data.length,
                ),
              );
            } else {
              return SliverToBoxAdapter(
                child: SizedBox(
                  height: 200.h,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }
          },
        ),
      );

  Container _buildBottomNav(BuildContext context) {
    return Container(
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
    );
  }

  Widget _buildRecomendedSpace(SpaceProvider spaceProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              bottom: (index == (mTipsList.length - 1)) ? 110.h : 20.h,
            ),
            child: TipsCard(mTipsList[index]),
          ),
        ),
        // NOTE: End of Recommended Space
        // NOTE: Bottom NavBar
      ],
    );
  }
}
