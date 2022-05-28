import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliver/utils/appColors.dart';
import 'package:fooddeliver/widgets/big_text.dart';
import 'package:fooddeliver/widgets/smalltext.dart';
import 'package:fooddeliver/utils/dimentions.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                padding: EdgeInsets.only(
                    left: Dimentions.widtht20, right: Dimentions.widtht20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: 'Bangladesh',
                          color: AppColors.mainColor,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: 'Natore',
                              color: Colors.black54,
                            ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        height: Dimentions.height45,
                        width: Dimentions.height45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: AppColors.mainColor,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: Dimentions.iconsize24,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: FoodPageBody(),
            )),
          ],
        ),
      ),
    );
  }
}
