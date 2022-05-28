import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliver/utils/appColors.dart';
import 'package:fooddeliver/utils/dimentions.dart';
import 'package:fooddeliver/widgets/smalltext.dart';

class ExpendedText extends StatefulWidget {
  final String text;
  const ExpendedText({Key? key, required this.text}) : super(key: key);

  @override
  _ExpendedTextState createState() => _ExpendedTextState();
}

class _ExpendedTextState extends State<ExpendedText> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimentions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return secondHalf.isEmpty
        ? SmallText(text: firstHalf)
        : Column(
            children: [
              SmallText(
                text:
                    hiddenText ? (firstHalf + "....") : firstHalf + secondHalf,
                color: AppColors.paraColor,
                size: Dimentions.font16,
                height: 1.6,
              ),
              // hiddenText
              //     ? SmallText(
              //         text: firstHalf + "....",
              //         color: AppColors.paraColor,
              //         size: Dimentions.font16,
              //         height: 1.6,
              //       )
              //     : SmallText(
              //         text: firstHalf + secondHalf,
              //         color: AppColors.paraColor,
              //         size: Dimentions.font16,
              //         height: 1.6),
              InkWell(
                onTap: () {
                  setState(() {
                    hiddenText = !hiddenText;
                  });
                },
                child: Row(
                  children: [
                    SmallText(
                      text: 'Show more',
                      color: AppColors.mainColor,
                    ),
                    Icon(
                      hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                      color: AppColors.mainColor,
                    ),
                  ],
                ),
              )
            ],
          );
  }
}
