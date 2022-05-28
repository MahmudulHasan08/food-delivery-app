import 'package:flutter/cupertino.dart';
import 'package:fooddeliver/utils/dimentions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double fontSize;
  TextOverflow textOverflow;
  BigText(
      {this.color = const Color(0xFF5c524f),
      required this.text,
      this.fontSize = 0,
      this.textOverflow = TextOverflow.ellipsis});
  // BigText({
  //   Key? key,
  //   this.color,
  //   required this.text,
  //   this.size = 20,
  //   this.textOverflow = TextOverflow.ellipsis,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: fontSize == 0 ? Dimentions.font20 : fontSize,
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        letterSpacing: 1.5,
      ),
    );
  }
}
