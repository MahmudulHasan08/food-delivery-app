import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliver/data/controller/cart_controller.dart';
import 'package:fooddeliver/data/controller/popular_product_controller.dart';
import 'package:fooddeliver/pages/home/main_food_page.dart';
import 'package:fooddeliver/routes/route_helper.dart';
import 'package:fooddeliver/utils/app_constants.dart';
import 'package:fooddeliver/utils/dimentions.dart';
import 'package:fooddeliver/widgets/app_column.dart';
import 'package:fooddeliver/widgets/app_icon.dart';
import 'package:fooddeliver/widgets/big_text.dart';
import 'package:fooddeliver/widgets/expendable_text.dart';
import 'package:fooddeliver/widgets/icon_text_widget.dart';
import 'package:fooddeliver/widgets/smalltext.dart';
import 'package:get/get.dart';

import '../../utils/appColors.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>());
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimentions.biraniImagesize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        product.img),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: Dimentions.height45,
              left: Dimentions.widtht20,
              right: Dimentions.widtht20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Get.to(() => MainFoodPage());
                      Get.toNamed(RouteHelper.initial);
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.add_shopping_cart,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: Dimentions.biraniImagesize - 15,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimentions.height20,
                    right: Dimentions.height20,
                    top: Dimentions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimentions.widtht20),
                    topRight: Radius.circular(Dimentions.widtht20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      bigText: product.name,
                    ),
                    SizedBox(
                      height: Dimentions.height20,
                    ),
                    BigText(text: 'Introduce'),
                    SizedBox(
                      height: Dimentions.height20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpendedText(text: product.description),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (popularproduct) {
          return Container(
            padding: EdgeInsets.all(Dimentions.widtht20),
            height: Dimentions.bottomheightbar,
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimentions.widtht20),
                topRight: Radius.circular(Dimentions.widtht20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(Dimentions.widtht20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimentions.widtht20),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          popularproduct.setQuantity(false);
                          print("decrement");
                        },
                        child: Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                      ),
                      SizedBox(
                        width: Dimentions.widtht10 / 2,
                      ),
                      BigText(text: popularproduct.quantity.toString()),
                      SizedBox(
                        width: Dimentions.widtht10 / 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          popularproduct.setQuantity(true);
                          print("increment");
                        },
                        child: Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(Dimentions.widtht20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimentions.widtht20),
                    color: AppColors.mainColor,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      popularproduct.addItem(product);
                    },
                    child: BigText(
                      text: "\$${product.price}" "|add to cart",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
