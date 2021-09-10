import 'package:flutter/material.dart';

// ignore: camel_case_types
class circleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Function onPresed;

  const circleButton(
      {Key key,
      @required this.icon,
      @required this.iconSize,
      @required this.onPresed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration:
          BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
      child: IconButton(
        icon: Icon(icon),
        iconSize: iconSize,
        color: Colors.black,
        onPressed: onPresed,
      ),
    );
  }
}
