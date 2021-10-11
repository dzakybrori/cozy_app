import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  final String tag;
  final Widget child;

  const HeroWidget({Key? key, required this.tag, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Hero(
        tag: tag,
        transitionOnUserGestures: true,
        child: Material(type: MaterialType.transparency, child: child),
      );
}
