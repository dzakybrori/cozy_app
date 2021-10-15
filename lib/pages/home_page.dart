import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../extension/extensions.dart';
import '../provider/space_provider.dart';
import '../shared/shared_value.dart';
import '../widgets/city_card.dart';
import '../widgets/my_text.dart';
import '../widgets/shimmer_widget.dart';
import '../widgets/space_card.dart';
import '../widgets/subheader_delegate.dart';
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

  // Scroll controller for pull request
  final _scrollController = ScrollController();

  late SpaceProvider _spaceProvider;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
    _spaceProvider = Provider.of<SpaceProvider>(context, listen: false);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (this.mounted) {
      super.setState(fn);
    } else {
      fn();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_spaceProvider.items.isEmpty && this.mounted) {
      _spaceProvider.getRecommendedSpaces();
    }
    return SafeArea(
      bottom: false,
      child: CustomScrollView(
        controller: _scrollController,
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
    );
  }

  void _scrollListener() {
    if (_scrollController.offset < -120) {
      print('Refresh Called');
      _spaceProvider.refresh();
    }
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
        sliver: Consumer<SpaceProvider>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return child ?? _buildShimmerLoading();
            } else if (value.items.length > 0) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: EdgeInsets.only(
                        top: (index > 0) ? context.dp(paddingEdge) : 0),
                    child: SpaceCard(value.items[index]),
                  ),
                  childCount: value.items.length,
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Center(child: MyText('Couln\'t load the page'))));
              return child ?? _buildShimmerLoading();
            }
          },
          child: _buildShimmerLoading(),
        ),
      );

  SliverList _buildShimmerLoading() => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
            padding:
                EdgeInsets.only(top: (index > 0) ? context.dp(paddingEdge) : 0),
            child: Row(children: [
              ShimmerWidget.rounded(
                  width: context.dp(130),
                  height: context.dp(110),
                  borderRadius: BorderRadius.circular(18)),
              SizedBox(width: context.dp(20)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidget.rectangle(
                      width: context.dp(160), height: context.dp(27)),
                  SizedBox(height: context.dp(2)),
                  ShimmerWidget.rectangle(
                      width: context.dp(105), height: context.dp(24)),
                  SizedBox(height: context.dp(16)),
                  ShimmerWidget.rectangle(
                      width: context.dp(144), height: context.dp(21)),
                ],
              ),
            ]),
          ),
          childCount: 4,
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
}
