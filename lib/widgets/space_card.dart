import 'package:cozy_app/models/space.dart';
import 'package:cozy_app/pages/detail_page.dart';
import 'package:cozy_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpaceCard extends StatelessWidget {
  final Space space;

  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(space),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: 30.h,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18.w),
              child: Container(
                width: 130.w,
                height: 110.h,
                child: Stack(
                  children: [
                    Image.network(
                      space.imageUrl,
                      width: 130.w,
                      height: 110.h,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 70.r,
                        height: 30.r,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36.w),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 6.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/icon_star.png',
                                width: 18.r,
                                height: 18.r,
                              ),
                              Text(
                                '${space.rating}/5',
                                style: btnTextStyle.copyWith(fontSize: 13.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 20.w),
            FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    space.name,
                    overflow: TextOverflow.ellipsis,
                    style: titleTextStyle.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text.rich(
                    TextSpan(
                      text: '\$${space.price}',
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
                  SizedBox(height: 16.h),
                  Text(
                    '${space.city}, ${space.country}',
                    style: subTitleTextStyle.copyWith(
                      fontSize: 14.sp,
                      color: greySubTextColor,
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
