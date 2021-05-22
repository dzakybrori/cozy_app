import 'package:flutter/material.dart';
import 'package:cozy_app/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: paddingEdge,
          ),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: paddingEdge,
                  right: paddingEdge,
                  bottom: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explore Now',
                      style: titleTextStyle.copyWith(
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Mencari kosan yang cozy',
                      style: subTitleTextStyle.copyWith(
                        fontSize: 16,
                        color: lightGreySubTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
