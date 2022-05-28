import 'package:flutter/material.dart';
import 'package:fooddeliver/utils/dimentions.dart';
import 'package:fooddeliver/widgets/smalltext.dart';

import '../utils/appColors.dart';
import 'big_text.dart';
import 'icon_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String bigText;
  AppColumn({required this.bigText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: bigText,
          fontSize: Dimentions.font26,
        ),
        SizedBox(
          height: Dimentions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 13.0,
                ),
              ),
            ),
            SizedBox(
              width: Dimentions.widtht10,
            ),
            SmallText(text: '4.5'),
            SizedBox(
              width: Dimentions.widtht10,
            ),
            SmallText(text: '1287'),
            SizedBox(
              width: Dimentions.widtht10,
            ),
            SmallText(text: 'Comments'),
          ],
        ),
        SizedBox(
          height: Dimentions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(
                icon: Icons.circle,
                iconColor: AppColors.IconColor1,
                text: 'Normal'),
            IconAndText(
                icon: Icons.location_on,
                iconColor: AppColors.mainColor,
                text: '1.7km'),
            IconAndText(
                icon: Icons.access_time_rounded,
                iconColor: AppColors.IconColor2,
                text: '32min'),
          ],
        )
      ],
    );
  }
}
