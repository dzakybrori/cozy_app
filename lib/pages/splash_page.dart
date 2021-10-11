import 'package:cozy_app/pages/home_page.dart';
import 'package:cozy_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 289.h,
                width: double.infinity,
                color: secondaryColor,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/images/house.png',
                height: 433.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 50.h,
                left: 30.w,
                right: 30.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50.r,
                    width: 50.r,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/logo.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(17.w),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 15.r, bottom: 15.r, right: 15.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Find Cozy House\nto Stay and Happy',
                            style: titleTextStyle.copyWith(fontSize: 24.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Stop membuang banyak waktu\npada tempat yang tidak habitable',
                            style: subTitleTextStyle.copyWith(
                              fontSize: 16.sp,
                              color: lightGreySubTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: Text(
                      'Explore Now',
                      style: btnTextStyle,
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 11.r,
                        horizontal: 50.r,
                      ),
                      primary: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.w),
                      ),
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
