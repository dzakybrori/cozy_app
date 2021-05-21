import 'package:cozy_app/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/logo.png',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Find Cozy House\nto Stay and Happy',
                style: titleTextStyle.copyWith(fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Stop membuang banyak waktu\npada tempat yang tidak habitable',
                style: subTitleTextStyle.copyWith(
                  fontSize: 16,
                  color: lightGreySubTextColor,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 210,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Explore Now',
                    style: btnTextStyle,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(11),
                    primary: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
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
