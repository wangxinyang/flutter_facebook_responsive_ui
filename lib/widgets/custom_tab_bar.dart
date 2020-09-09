import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/conifg/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> _icons;
  final int selectedIndex;
  final Function(int) ontab;
  const CustomTabBar({
    Key key,
    @required List<IconData> icons,
    @required this.selectedIndex,
    @required this.ontab,
  })  : _icons = icons,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Palette.facebookBlue,
            width: 3,
          ),
        ),
      ),
      tabs: _icons
          .asMap()
          .map(
            (index, item) => MapEntry(
              index,
              Tab(
                icon: Icon(
                  item,
                  color: index == selectedIndex
                      ? Palette.facebookBlue
                      : Colors.black45,
                  size: 30,
                ),
              ),
            ),
          )
          .values
          .toList(),
      onTap: ontab,
    );
  }
}
