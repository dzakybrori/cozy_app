import 'package:cozy_app/pages/home_page.dart';
import 'package:cozy_app/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.all(38),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/error_404.png',
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'Where are you going?',
                style: titleTextStyle.copyWith(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Seems like the page that you were\nrequested is already gone',
                style: subTitleTextStyle.copyWith(
                  fontSize: 16,
                  color: lightGreySubTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
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
                    horizontal: 42,
                    vertical: 12,
                  ),
                  child: Text(
                    'Back to Home',
                    style: btnTextStyle,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
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
