import 'package:cozy_app/theme.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: Color(0XFFF6F7F8),
        child: Column(
          children: [
            Image.asset(
              'assets/images/city1_jakarta.png',
              width: 120,
              height: 102,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              'Jakarta',
              style: titleTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
