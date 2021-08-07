import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cozy_app/pages/home_page.dart';
import 'package:cozy_app/theme.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.all(38.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/error_404.png',
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: 70.h,
              ),
              Text(
                'Where are you going?',
                style: titleTextStyle.copyWith(
                  fontSize: 24.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                'Seems like the page that you were\nrequested is already gone',
                style: subTitleTextStyle.copyWith(
                  fontSize: 16.sp,
                  color: lightGreySubTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50.h,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                    (route) => false,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 42.w,
                    vertical: 12.h,
                  ),
                  child: Text(
                    'Back to Home',
                    style: btnTextStyle,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17.w),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
