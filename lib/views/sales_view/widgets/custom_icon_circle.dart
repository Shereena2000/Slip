import 'package:flutter/material.dart';

class CustomIconCircle extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double radius;
  final double iconSize;

  const CustomIconCircle({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    this.iconColor = Colors.white,
    this.radius = 15,
    this.iconSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      radius: radius,
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
