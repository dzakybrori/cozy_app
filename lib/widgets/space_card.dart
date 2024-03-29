import 'dart:math';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './my_image_network.dart';
import './my_text.dart';
import '../extension/extensions.dart';
import '../models/space.dart';
import '../pages/detail_page.dart';

class SpaceCard extends StatelessWidget {
  final Space space;

  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: context.background,
      middleColor: context.background,
      openColor: context.background,
      closedElevation: 0,
      transitionDuration: Duration(seconds: 1),
      closedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      openBuilder: (context, action) => DetailPage(space),
      closedBuilder: (context, action) => Stack(
        children: [
          Row(
            children: [
              _buildSpaceImage(context),
              SizedBox(width: context.dp(20)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(space.name, style: context.text.bodyLarge),
                    _buildPriceText(context),
                    SizedBox(height: context.dp(16)),
                    MyText('${space.city}, ${space.country}',
                        style: context.text.bodyMedium),
                  ],
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              color: Colors.transparent,
              child: InkWell(
                  onTap: action, borderRadius: BorderRadius.circular(18)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPriceText(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: '\$${space.price}',
          children: [
            TextSpan(text: ' / month', style: context.text.titleMedium)
          ],
          style: context.text.labelLarge),
      textScaleFactor: context.ts,
    );
  }

  ClipRRect _buildSpaceImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: context.dp(130),
        height: context.dp(110),
        child: Stack(
          children: [
            MyImageNetwork(
              space.imageUrl,
              width: double.infinity,
              height: double.infinity,
            ),
            _buildSpaceRating(context)
          ],
        ),
      ),
    );
  }

  Align _buildSpaceRating(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: LayoutBuilder(
        builder: (context, constraint) {
          return Container(
            width: min(context.dp(70), constraint.maxWidth / 2),
            height: context.dp(30),
            decoration: BoxDecoration(
              color: context.primaryColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: context.dp(16),
                right: context.dp(12),
                top: context.dp(4),
                bottom: context.dp(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svg/icon_star.svg',
                      width: context.dp(18), color: context.secondaryColor),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child:
                          MyText('${space.rating}/5', style: context.text.bodySmall),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
