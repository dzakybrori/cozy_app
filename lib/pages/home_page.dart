import 'package:cozy_app/widgets/subheader_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../extension/extensions.dart';
import '../models/space.dart';
import '../provider/space_provider.dart';
import '../shared/shared_value.dart';
import '../widgets/bottom_navbar_item.dart';
import '../widgets/city_card.dart';
import '../widgets/my_text.dart';
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
            _buildSubHeaderPersistent(),
            _buildRecommendedSpaces(),
            _buildSubHeader(_subHeader[2]),
            _buildTipsAndGuidance(),
          ],
        ),
      ),
      floatingActionButton: _buildBottomNav(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  SliverAppBar _buildHeader() => SliverAppBar(
        elevation: 0,
        titleSpacing: 0,
        leadingWidth: 0,
        toolbarHeight: context.dp(86),
        automaticallyImplyLeading: false,
        backgroundColor: context.background,
        title: Padding(
          padding: EdgeInsets.only(
              top: context.dp(30), left: context.dp(paddingEdge)),
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

  SliverPersistentHeader _buildSubHeaderPersistent() => SliverPersistentHeader(
        pinned: true,
        delegate: SubHeaderDelegate(subTitle: _subHeader[1]),
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
                    padding: EdgeInsets.only(
                        top: (index > 0) ? context.dp(paddingEdge) : 0),
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

  SliverPadding _buildTipsAndGuidance() {
    return SliverPadding(
      padding: EdgeInsets.only(
        left: context.dp(paddingEdge),
        right: context.dp(paddingEdge),
        bottom: context.dp(110),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
              padding: EdgeInsets.only(top: (index > 0) ? context.dp(20) : 0),
              child: TipsCard(mTipsList[index])),
          childCount: mTipsList.length,
        ),
      ),
    );
  }

  Container _buildBottomNav(BuildContext context) {
    return Container(
      height: context.dp(65),
      width: context.dp(327),
      margin: EdgeInsets.symmetric(
          horizontal: context.dp(paddingEdge), vertical: context.h(8)),
      decoration: BoxDecoration(
          color: context.surface, borderRadius: BorderRadius.circular(23)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavbarItem(
            imageUrl: 'assets/svg/icon_home.svg',
            isActive: true,
          ),
          BottomNavbarItem(
            imageUrl: 'assets/svg/icon_mail.svg',
            isActive: false,
          ),
          BottomNavbarItem(
            imageUrl: 'assets/svg/icon_card.svg',
            isActive: false,
          ),
          BottomNavbarItem(
            imageUrl: 'assets/svg/icon_love.svg',
            isActive: false,
          ),
        ],
      ),
    );
  }
}
