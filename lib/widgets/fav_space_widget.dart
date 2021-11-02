import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './hero_widget.dart';
import './my_image_network.dart';
import './my_text.dart';
import '../extension/extensions.dart';
import '../models/space.dart';
import '../pages/detail_page.dart';

class FavSpaceWidget extends StatefulWidget {
  final Space space;

  const FavSpaceWidget({Key? key, required this.space}) : super(key: key);

  @override
  _FavSpaceWidgetState createState() => _FavSpaceWidgetState();
}

class _FavSpaceWidgetState extends State<FavSpaceWidget> {
  bool _isExpanded = false;

  @override
  void setState(VoidCallback fn) {
    if (this.mounted) {
      super.setState(fn);
    } else {
      fn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dp(4)),
      child: Container(
        width: context.dp(280),
        height: context.h(300),
        margin: EdgeInsets.only(top: context.dp(20)),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            _buildAnimatedSpaceInfo(context),
            _buildAnimatedSpaceImage(context),
          ],
        ),
      ),
    );
  }

  void _onTap() {
    if (!_isExpanded) {
      setState(() => _isExpanded = true);
    } else {
      Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            reverseTransitionDuration: Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) {
              final curvedAnimation = CurvedAnimation(
                  parent: animation, curve: Curves.easeInOutCubic);

              return FadeTransition(
                opacity: curvedAnimation,
                child: DetailPage(widget.space),
              );
            }),
      );
    }
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() => _isExpanded = true);
    } else if (details.delta.dy > 0) {
      setState(() => _isExpanded = false);
    }
  }

  List<Widget> _starWidgets() => List.generate(
        5,
        (index) => Padding(
          padding: EdgeInsets.only(right: context.dp(4)),
          child: SvgPicture.asset(
            'assets/svg/icon_star.svg',
            width: context.dp(18),
            height: context.dp(18),
            color: index < widget.space.rating
                ? context.secondaryColor
                : context.disableColor,
          ),
        ),
      );

  Widget _buildPriceText(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: '\$${widget.space.price}',
          children: [TextSpan(text: ' / month', style: context.text.subtitle1)],
          style: context.text.button),
      textScaleFactor: context.ts,
    );
  }

  AnimatedPositioned _buildAnimatedSpaceInfo(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      top: _isExpanded ? context.h(150) : context.h(60),
      bottom: _isExpanded ? context.h(10) : context.h(100),
      width: _isExpanded ? context.dp(280) : context.dp(260),
      child: Container(
        padding: EdgeInsets.all(context.dp(20)),
        decoration: BoxDecoration(
            color: context.surface, borderRadius: BorderRadius.circular(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MyText('${widget.space.city}, ${widget.space.country}',
                style: context.text.bodyText2),
            HeroWidget(
                tag: widget.space.id.spaceName,
                child:
                    MyText(widget.space.name, style: context.text.bodyText1)),
            Row(
              children: [
                HeroWidget(
                    tag: widget.space.id.spacePrice,
                    child: _buildPriceText(context)),
                Spacer(),
                HeroWidget(
                    tag: widget.space.id.spaceStars,
                    child: Row(children: _starWidgets())),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AnimatedPositioned _buildAnimatedSpaceImage(BuildContext context) {
    return AnimatedPositioned(
        duration: Duration(milliseconds: 500),
        top: _isExpanded ? context.h(20) : context.h(50),
        left: _isExpanded ? context.dp(12) : 0,
        right: _isExpanded ? context.dp(12) : 0,
        bottom: _isExpanded ? context.h(150) : context.h(100),
        child: GestureDetector(
          onPanUpdate: _onPanUpdate,
          onTap: _onTap,
          child: Material(
            elevation: 6,
            borderRadius: BorderRadius.circular(24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: MyImageNetwork(widget.space.imageUrl),
            ),
          ),
        ));
  }
}
