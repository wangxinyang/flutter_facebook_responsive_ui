import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData iconData;
  final double iconSize;
  final Function press;
  const CircleButton({
    Key key,
    @required this.iconData,
    @required this.iconSize,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(iconData),
        iconSize: iconSize,
        onPressed: press,
        color: Colors.black,
      ),
    );
  }
}
