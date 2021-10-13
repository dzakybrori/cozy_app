import 'package:flutter/material.dart';

import './bottom_navbar_item.dart';
import '../extension/extensions.dart';
import '../shared/shared_value.dart';

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
    required this.selectedItemColor,
    required this.unSelectedItemColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dp(85),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: context.dw,
              height: context.dp(65),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.background,
                    context.background.withOpacity(0.2)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: context.dp(65),
              margin: EdgeInsets.symmetric(horizontal: context.dp(paddingEdge)),
              decoration: BoxDecoration(
                  color: context.surface,
                  borderRadius: BorderRadius.circular(23)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _generateItems(context),
              ),
            ),
          ),
        ],
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
      child: BottomNavbarItem(
        imageUrl: icon,
        isActive: selectedIndex == index,
        selectedItemColor: selectedItemColor,
        unSelectedItemColor: unSelectedItemColor,
      ),
    );
  }
}
