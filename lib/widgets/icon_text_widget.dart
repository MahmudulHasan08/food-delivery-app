import 'package:flutter/material.dart';
import 'package:fooddeliver/widgets/smalltext.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;

  IconAndText({
    required this.icon,
    this.iconColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SmallText(text: text),
      ],
    );
  }
}
