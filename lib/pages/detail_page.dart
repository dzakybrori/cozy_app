import 'package:cozy_app/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import './error_page.dart';
import '../extension/extensions.dart';
import '../models/space.dart';
import '../shared/shared_value.dart';
import '../shared/theme.dart';
import '../widgets/facility_item.dart';
import '../widgets/rating_item.dart';

class DetailPage extends StatefulWidget {
  final Space space;

  DetailPage(this.space, {Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isWished = false;

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
          name: 'Big Lemari',
          total: widget.space.totalCupBoard,
        ),
      ];

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
      backgroundColor: Colors.white,
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
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _buildTopContent(),
                    // NOTE: PHOTOS SECTION
                    _buildPhotoSection(),
                    // END OF PHOTOS SECTION
                    _buildLocationSection(launchURL, context, showConfirmation),
                  ],
                ),
              ),
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
  Row _buildRatingStars() => Row(
      children: [1, 2, 3, 4, 5]
          .map((index) => Padding(
              padding: EdgeInsets.only(left: context.dp(2)),
              child: RatingItem(index: index, rating: widget.space.rating)))
          .toList());
  // NOTE: END OF SMALL WIDGET

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
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
                child: Image.network(widget.space.imageUrl, fit: BoxFit.cover)),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: context.dp(30),
                decoration: BoxDecoration(
                  color: Colors.white,
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
            ),
          ],
        ),
      ),
    );
  }

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
                    MyText(widget.space.name,
                        style: context.text.headline6?.copyWith(fontSize: 22)),
                    MyRichText(priceText: '\$${widget.space.price}')
                  ])),
              _buildRatingStars(),
            ],
          ),
        ),
      );

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
              SizedBox(height: context.dp(12)),
              content
            ],
          ),
        ),
      );

  // NOTE: MAIN FACILITIES
  Row _buildFacilitiesWidget() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _facilities(),
      );
  // NOTE: END OF MAIN FACILITIES

  // NOTE: PHOTOS SECTION
  Container _buildPhotoSection() {
    return Container(
      height: 108.r,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.space.photos.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: (index == 0) ? paddingEdge.w : 0,
              right: (index == (widget.space.photos.length - 1))
                  ? paddingEdge.w
                  : 18.w,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.w),
              child: Image.network(
                widget.space.photos[index],
                width: 135.r,
                height: 108.r,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
  // NOTE: END OF PHOTOS SECTION

  Padding _buildTopContent() {
    return Padding(
      padding: EdgeInsets.only(
          left: context.dp(paddingEdge), right: context.dp(paddingEdge)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          Text(
            'Photos',
            style: regulerTextStyle,
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }

  Padding _buildLocationSection(void launchURL(String url),
      BuildContext context, Future<void> showConfirmation()) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 40.h,
        left: paddingEdge.w,
        right: paddingEdge.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          Text(
            'Location',
            style: regulerTextStyle,
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.space.address}\n${widget.space.city}',
                style: regulerTextStyle.copyWith(
                  fontSize: 15.sp,
                  color: greySubTextColor,
                ),
              ),
              InkWell(
                onTap: () {
                  launchURL(widget.space.mapUrl);
                  //https://goo.gl/maps/c9DNdN65Tr5gMu4KA
                },
                child: Image.asset(
                  'assets/images/btn_map.png',
                  width: 40.w,
                ),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          _buildBookButton(context, showConfirmation),
        ],
      ),
    );
  }

  Container _buildBookButton(
      BuildContext context, Future<void> showConfirmation()) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          showConfirmation();
        },
        child: Text(
          'Book Now',
          style: btnTextStyle,
        ),
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17.w),
          ),
        ),
      ),
    );
  }

  Container _buildActionBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: paddingEdge.w,
      ),
      child: Column(
        children: [
          SizedBox(height: 30.h),
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
                    width: 46.r,
                    height: 46.r,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isWished = !isWished;
                    });
                  },
                  child: Image.asset(
                    isWished
                        ? 'assets/images/btn_wishlist_active.png'
                        : 'assets/images/btn_wishlist_inactive.png',
                    width: 46.r,
                    height: 46.r,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
