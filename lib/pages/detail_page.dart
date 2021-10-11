import 'package:cozy_app/models/space.dart';
import 'package:cozy_app/pages/error_page.dart';
import 'package:cozy_app/shared/theme.dart';
import 'package:cozy_app/widgets/facility_item.dart';
import 'package:cozy_app/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Space space;

  DetailPage(this.space);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isWhished = false;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void launchURL(String url) async => await canLaunch(url)
        ? await launch(url)
        : Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ErrorPage(),
            ),
          );

    Future<void> showConfirmation() async {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Konfirmasi'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text('Apakah kamu ingin menghubungi pemilik kos?'),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Batal'),
              ),
              TextButton(
                onPressed: () => launchURL('tel:${widget.space.phone}'),
                child: Text('Hubungi'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              _buildSliverAppBar(),
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

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      elevation: 0,
      stretch: true,
      floating: true,
      titleSpacing: 0,
      forceElevated: false,
      expandedHeight: 350.h,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      shadowColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        stretchModes: const <StretchMode>[
          StretchMode.zoomBackground,
        ],
        background: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            Image.network(
              widget.space.imageUrl,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 35.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      spreadRadius: 8.r,
                      blurRadius: 50.r,
                      offset: Offset(0, 0), // changes position of shadow
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

  Padding _buildTopContent() {
    return Padding(
      padding: EdgeInsets.only(
        left: paddingEdge.w,
        right: paddingEdge.w,
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
                    widget.space.name,
                    style: titleTextStyle.copyWith(
                      fontSize: 22.sp,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: '\$${widget.space.price}',
                      children: [
                        TextSpan(
                          text: ' / month',
                          style: subTitleTextStyle.copyWith(
                            color: greySubTextColor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                      style: titleTextStyle.copyWith(
                        fontSize: 16.sp,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [1, 2, 3, 4, 5]
                    .map(
                      (index) => Container(
                        margin: EdgeInsets.only(
                          left: 2.w,
                        ),
                        child: RatingItem(
                          index: index,
                          rating: widget.space.rating,
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
          SizedBox(height: 30.h),
          Text(
            'Main Facilities',
            style: regulerTextStyle,
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FacilityItem(
                imageUrl: 'assets/images/icon_kitchen.png',
                name: 'Kitchen',
                total: widget.space.totalKitchens,
              ),
              FacilityItem(
                imageUrl: 'assets/images/icon_bedroom.png',
                name: 'Bedroom',
                total: widget.space.totalBedroom,
              ),
              FacilityItem(
                imageUrl: 'assets/images/icon_cupboard.png',
                name: 'Big Lemari',
                total: widget.space.totalCupBoard,
              ),
            ],
          ),
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
                      isWhished = !isWhished;
                    });
                  },
                  child: Image.asset(
                    isWhished
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
