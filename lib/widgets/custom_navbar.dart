import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> icons;
  final ValueChanged<int>? onTap;
  final Color selectedItemColor;
  final Color unSelectedItemColor;

  const CustomNavBar({
    required this.icons,
    this.onTap,
    this.selectedIndex = 0,
    this.selectedItemColor = const Color(0xff14145F),
    this.unSelectedItemColor = const Color(0xff9191E3),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59,
      padding: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffA1A1DE), Color(0xffA1A1DE).withOpacity(0)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _generateItems(context),
      ),
    );
  }

  List<Widget> _generateItems(BuildContext context) {
    List<Widget> _items = [];
    for (int i = 0; i < icons.length; i++) {
      _items.add(_buildItem(context, icons[i], i, () => onTap?.call(i)));
    }
    return _items;
  }

  Widget _buildItem(
      BuildContext context, String icon, int index, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: 50,
        width: 50,
        alignment:
            (selectedIndex == index) ? Alignment.topCenter : Alignment.center,
        child: SvgPicture.asset(icon,
            width: 24,
            color: (selectedIndex == index)
                ? selectedItemColor
                : unSelectedItemColor),
      ),
    );
  }
}
