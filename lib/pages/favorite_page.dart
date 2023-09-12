import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './error_page.dart';
import '../extension/extensions.dart';
import '../provider/space_provider.dart';
import '../widgets/fav_space_widget.dart';
import '../widgets/my_image_network.dart';
import '../widgets/my_text.dart';

class FavoritePage extends StatelessWidget {
  final controller = PageController();

  FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SpaceProvider>(
      builder: (context, value, child) {
        if (value.favItems.length > 0) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(bottom: context.dp(30)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _buildBackground(value),
                  _buildCarousalWidgets(value, context),
                  _buildAppBar(context),
                ],
              ),
            ),
          );
        } else {
          return child!;
        }
      },
      child: ErrorPage(
        key: Key('Fav-Error'),
        useButton: false,
        errorTitle: 'Favorite Space',
        errorSubTitle: 'You don\'t have any favorite space yet.',
      ),
    );
  }

  Align _buildAppBar(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: context.dp(320),
        height: context.dp(80),
        padding: EdgeInsets.only(bottom: context.dp(16)),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            color: context.surface,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
        child: MyText('Favorite Space',
            style: context.text.titleLarge?.copyWith(fontSize: 20)),
      ),
    );
  }

  Widget _buildBackgroundImage(BuildContext context, String imageUrl) =>
      ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black87, Colors.transparent],
        ).createShader(
            Rect.fromLTRB(0, bounds.height * 0.5, bounds.width, bounds.height)),
        blendMode: BlendMode.dstIn,
        child: MyImageNetwork(imageUrl),
      );

  PageView _buildBackground(SpaceProvider value) => PageView.builder(
        reverse: true,
        controller: controller,
        itemCount: value.favItems.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) =>
            _buildBackgroundImage(context, value.favItems[index].imageUrl),
      );

  Center _buildCarousalWidgets(SpaceProvider value, BuildContext context) =>
      Center(
        child: CarouselSlider.builder(
            itemCount: value.favItems.length,
            itemBuilder: (context, index, realIndex) => FavSpaceWidget(
                key: Key('FavWidget-${value.favItems[index].id}'),
                space: value.favItems[index]),
            options: CarouselOptions(
              initialPage: 0,
              pageSnapping: true,
              viewportFraction: 0.75,
              enlargeCenterPage: true,
              height: context.dh * 0.7,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              scrollPhysics: BouncingScrollPhysics(),
              onPageChanged: (index, reason) => controller.animateToPage(index,
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeInOutCubic),
            )),
      );
}
