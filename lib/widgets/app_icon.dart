import 'package:flutter/material.dart';
import 'package:fooddeliver/utils/dimentions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;
  double? size;
  AppIcon(
      {required this.icon,
      this.backgroundColor = const Color(0xFFffffff),
      this.iconColor = const Color(0xFF756d54),
      this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimentions.radi20),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        size: Dimentions.iconsize16,
        color: iconColor,
      ),
    );
  }
}
