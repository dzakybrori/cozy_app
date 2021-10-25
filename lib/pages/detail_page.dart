import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import './error_page.dart';
import '../extension/extensions.dart';
import '../models/space.dart';
import '../provider/space_provider.dart';
import '../shared/shared_value.dart';
import '../widgets/facility_item.dart';
import '../widgets/hero_widget.dart';
import '../widgets/my_image_network.dart';
import '../widgets/my_text.dart';
import '../widgets/rating_item.dart';

class DetailPage extends StatefulWidget {
  final Space space;

  DetailPage(this.space, {Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late bool _isWished = widget.space.isFavorite;
  double _heartOpacity = 0.0;

  static const List<String> _subTitles = [
    'Main Facilities',
    'Photos',
    'Location'
  ];

  List<Widget> _facilities() => [
        FacilityItem(
          imageUrl: 'assets/svg/icon_bar.svg',
          name: 'Kitchen',
          total: widget.space.totalKitchens,
        ),
        FacilityItem(
          imageUrl: 'assets/svg/icon_bed.svg',
          name: 'Bedroom',
          total: widget.space.totalBedroom,
        ),
        FacilityItem(
          imageUrl: 'assets/svg/icon_cupboard.svg',
          name: 'Cupboard',
          total: widget.space.totalCupBoard,
        ),
      ];

  late SpaceProvider _spaceProvider;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    _spaceProvider = Provider.of<SpaceProvider>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              _buildSliverAppBar(),
              // NOTE: HEADER SECTION
              _buildSpaceHeader(),
              // NOTE: MAIN FACILITIES
              _buildContentSection(_subTitles[0], _buildFacilitiesWidget()),
              // NOTE: PHOTOS SECTION
              ..._buildPhotoSection(),
              // NOTE: LOCATION SECTION
              _buildContentSection(_subTitles[2], _buildLocationSections()),
              // NOTE: BOOK BUTTON
              _buildBookButton(context),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _buildActionBar(context),
          ),
        ],
      ),
    );
  }

  void launchURL(String url) async => await canLaunch(url)
      ? await launch(url)
      : Navigator.push(
          context, MaterialPageRoute(builder: (context) => ErrorPage()));

  void _onClickFav() => setState(() {
        if (!_isWished) {
          _heartOpacity = 1.0;
        }
        _isWished = _spaceProvider.favToggle(widget.space.id);
      });

  Future<void> showConfirmation() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: MyText('Konfirmasi'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                MyText('Apakah kamu ingin menghubungi pemilik kos?', maxLine: 3)
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: MyText('Batal'),
            ),
            TextButton(
              onPressed: () => launchURL('tel:${widget.space.phone}'),
              child: MyText('Hubungi'),
            ),
          ],
        );
      },
    );
  }

  // NOTE: SMALL WIDGET
  Align _buildTopModalRounded() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: context.dp(30),
          decoration: BoxDecoration(
            color: context.background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 8,
                blurRadius: 50,
                offset: Offset(0, -10),
              ),
            ],
          ),
        ),
      );

  Widget _buildRatingStars() => Row(
      mainAxisSize: MainAxisSize.min,
      children: [1, 2, 3, 4, 5]
          .map((index) => Padding(
              padding: EdgeInsets.only(left: context.dp(2)),
              child: RatingItem(index: index, rating: widget.space.rating)))
          .toList());

  SliverPadding _buildBookButton(BuildContext context) => SliverPadding(
        padding: EdgeInsets.symmetric(
            vertical: context.dp(30), horizontal: context.dp(paddingEdge)),
        sliver: SliverToBoxAdapter(
            child: ElevatedButton(
                onPressed: showConfirmation, child: MyText('Book Now'))),
      );

  // NOTE: END OF SMALL WIDGET

  // NOTE: SLIVER APP BAR
  SliverAppBar _buildSliverAppBar() => SliverAppBar(
        elevation: 0,
        stretch: true,
        floating: true,
        titleSpacing: 0,
        leadingWidth: 0,
        forceElevated: false,
        expandedHeight: context.h(350),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        shadowColor: Colors.white,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: context.dp(4)),
                  child: GestureDetector(
                    onDoubleTap: _onClickFav,
                    child: MyImageNetwork(widget.space.imageUrl),
                  )),
              _buildTopModalRounded(),
              AnimatedScale(
                duration: Duration(seconds: 1),
                scale: _isWished ? 1 : 0,
                curve: Curves.elasticOut,
                onEnd: () => setState(() => _heartOpacity = 0.0),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  opacity: _heartOpacity,
                  child: Icon(
                    Icons.favorite_rounded,
                    color: Colors.white60,
                    size: context.dp(100),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  // NOTE: END OF SLIVER APP BAR

  // NOTE: SPACE HEADER
  SliverPadding _buildSpaceHeader() => SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: context.dp(paddingEdge)),
        sliver: SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    HeroWidget(
                      tag: widget.space.id.spaceName,
                      child: MyText(widget.space.name,
                          style:
                              context.text.headline6?.copyWith(fontSize: 22)),
                    ),
                    HeroWidget(
                        tag: widget.space.id.spacePrice,
                        child: MyRichText(priceText: '\$${widget.space.price}'))
                  ])),
              HeroWidget(
                  tag: widget.space.id.spaceStars, child: _buildRatingStars()),
            ],
          ),
        ),
      );

  // NOTE: END OF SPACE HEADER

  // NOTE: TEMPLATE SECTION
  SliverPadding _buildContentSection(String subTitle, Widget content,
          [double space = 12]) =>
      SliverPadding(
        padding: EdgeInsets.only(
          top: context.dp(30),
          left: context.dp(paddingEdge),
          right: context.dp(paddingEdge),
        ),
        sliver: SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(subTitle, style: context.text.subtitle2),
              SizedBox(height: context.dp(space)),
              content
            ],
          ),
        ),
      );

  // NOTE: END OF TEMPLATE SECTION

  // NOTE: MAIN FACILITIES
  Row _buildFacilitiesWidget() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _facilities(),
      );

  // NOTE: END OF MAIN FACILITIES

  // NOTE: PHOTOS SECTION
  List<Widget> _buildPhotoSection() => [_buildPhotosHeader(), _buildPhotos()];

  SliverPadding _buildPhotosHeader() => SliverPadding(
        padding: EdgeInsets.only(
          top: context.dp(30),
          left: context.dp(paddingEdge),
          right: context.dp(paddingEdge),
          bottom: context.dp(12),
        ),
        sliver: SliverToBoxAdapter(
            child: MyText(_subTitles[1], style: context.text.subtitle2)),
      );

  SliverToBoxAdapter _buildPhotos() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: context.dp(88),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: widget.space.photos.length,
          padding: EdgeInsets.symmetric(horizontal: context.dp(paddingEdge)),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: (index > 0) ? context.dp(18) : 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: MyImageNetwork(
                  widget.space.photos[index],
                  width: context.dp(110),
                  height: context.dp(88),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // NOTE: END OF PHOTOS SECTION

  // NOTE: LOCATION SECTION
  Row _buildLocationSections() => Row(
        children: [
          Expanded(
            child: MyText('${widget.space.address}\n${widget.space.city}',
                style: context.text.bodyText2
                    ?.copyWith(fontWeight: FontWeight.normal)),
          ),
          SizedBox(width: context.dp(30)),
          InkWell(
            onTap: () => launchURL(widget.space.mapUrl),
            borderRadius: BorderRadius.circular(300),
            child: Container(
              width: context.dp(40),
              height: context.dp(40),
              padding: EdgeInsets.all(context.dp(9)),
              decoration:
                  BoxDecoration(color: context.surface, shape: BoxShape.circle),
              child: SvgPicture.asset('assets/svg/icon_location.svg',
                  color: context.disableColor),
            ),
          ),
        ],
      );

  // NOTE: END OF LOCATION SECTION

  // NOTE: ACTION BAR
  Container _buildActionBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.dp(paddingEdge)),
      child: Column(
        children: [
          SizedBox(height: context.h(30)),
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: context.dp(40),
                  height: context.dp(40),
                  decoration: BoxDecoration(
                      color: context.background, shape: BoxShape.circle),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                    iconSize: context.dp(16),
                    color: context.onBackground,
                    padding: EdgeInsets.only(right: context.dp(2)),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Container(
                  width: context.dp(40),
                  height: context.dp(40),
                  decoration: BoxDecoration(
                      color: context.background, shape: BoxShape.circle),
                  child: IconButton(
                    icon: Icon(_isWished
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded),
                    iconSize: context.dp(18),
                    color: _isWished
                        ? context.secondaryColor
                        : context.onBackground,
                    padding: EdgeInsets.all(context.dp(10)),
                    onPressed: _onClickFav,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
// NOTE: END OF ACTION BAR
}
