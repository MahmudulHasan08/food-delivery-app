import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliver/data/controller/recommended_product_controller.dart';
import 'package:fooddeliver/routes/route_helper.dart';
import 'package:fooddeliver/utils/appColors.dart';
import 'package:fooddeliver/utils/app_constants.dart';
import 'package:fooddeliver/utils/dimentions.dart';
import 'package:fooddeliver/widgets/app_icon.dart';
import 'package:fooddeliver/widgets/big_text.dart';
import 'package:fooddeliver/widgets/expendable_text.dart';
import 'package:fooddeliver/widgets/smalltext.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  int pageId;
  RecommendedFoodDetail({required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 65,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.initial);
                  },
                  child: AppIcon(icon: Icons.clear),
                ),
                AppIcon(icon: Icons.safety_divider)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimentions.widtht20),
                      topRight: Radius.circular(Dimentions.widtht20),
                    )),
                padding: EdgeInsets.only(top: 5, bottom: 10),
                width: double.maxFinite,
                child: Center(
                    child: BigText(
                  text: product.name,
                  fontSize: Dimentions.font26,
                )),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.yellowAccent,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(AppConstants.BASE_URL +
                  AppConstants.UPLOAD_URL +
                  product.img),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimentions.widtht20),
                topRight: Radius.circular(Dimentions.widtht20),
              )),
              padding: EdgeInsets.only(
                  left: Dimentions.widtht20, right: Dimentions.widtht10),
              child: Column(
                children: [
                  Container(
                    child: ExpendedText(
                      text: product.description!,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(
                left: Dimentions.height20 * 2.5,
                right: Dimentions.height20 * 2.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                ),
                BigText(
                  text: "\$${product.price}" + "X " + "0",
                  fontSize: Dimentions.font26,
                ),
                AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimentions.height30),
                  topRight: Radius.circular(Dimentions.height30),
                )),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: Dimentions.height30),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(Dimentions.height20)),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: Dimentions.height20),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimentions.height20),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(Dimentions.height20),
                      child: Row(
                        children: [
                          BigText(text: "\$${product.price} | Add To Cart"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
