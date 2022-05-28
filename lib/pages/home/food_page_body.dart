import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliver/data/controller/popular_product_controller.dart';
import 'package:fooddeliver/data/controller/recommended_product_controller.dart';
import 'package:fooddeliver/modals/products_modal.dart';
import 'package:fooddeliver/pages/food/popular_food_details.dart';
import 'package:fooddeliver/routes/route_helper.dart';
import 'package:fooddeliver/utils/appColors.dart';
import 'package:fooddeliver/utils/app_constants.dart';
import 'package:fooddeliver/utils/dimentions.dart';
import 'package:fooddeliver/widgets/app_column.dart';
import 'package:fooddeliver/widgets/big_text.dart';
import 'package:fooddeliver/widgets/icon_text_widget.dart';
import 'package:fooddeliver/widgets/smalltext.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.83);
  var currPageVlaue = 0.0;
  double _scaleFactor = 0.8;
  double height = 220.0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageVlaue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        GetBuilder<PopularProductController>(builder: (popularproducts) {
          return popularproducts.isLoaaded
              ? Container(
                  // color: Colors.blue,
                  height: Dimentions.pageView,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: popularproducts.popularProductList.length,
                    itemBuilder: (context, position) {
                      return _buildPageItem(position,
                          popularproducts.popularProductList[position]);
                    },
                  ),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
        //dots section
        GetBuilder<PopularProductController>(builder: (popularproducts) {
          return new DotsIndicator(
            dotsCount: popularproducts.popularProductList.isEmpty
                ? 1
                : popularproducts.popularProductList.length,
            position: currPageVlaue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(
          height: Dimentions.height30,
        ),
        Container(
          margin: EdgeInsets.only(
            left: Dimentions.height20,
            right: Dimentions.height20,
            bottom: Dimentions.width30 * 1.5,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimentions.widtht10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 3.0),
                child: BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimentions.widtht10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(text: 'Food Pairing'),
              ),
            ],
          ),
        ),
        GetBuilder<RecommendedProductController>(builder: (recommendedproduct) {
          return recommendedproduct.isLoaaded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedproduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecommendedFood(index));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimentions.widtht20,
                            right: Dimentions.widtht20),
                        child: Row(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(bottom: Dimentions.height10),
                              height: Dimentions.listviewImgsize,
                              width: Dimentions.listviewImgsize,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimentions.radi20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(AppConstants.BASE_URL +
                                      AppConstants.UPLOAD_URL +
                                      recommendedproduct
                                          .recommendedProductList[index].img),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: Dimentions.listviewTextcont,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimentions.radi20),
                                    bottomRight:
                                        Radius.circular(Dimentions.radi20),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: BigText(
                                              text: recommendedproduct
                                                  .recommendedProductList[index]
                                                  .name),
                                        ),
                                        SizedBox(
                                          height: Dimentions.widtht10,
                                        ),
                                        SmallText(
                                            text:
                                                'with chaines characteristics'),
                                        SizedBox(
                                          height: Dimentions.widtht10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == currPageVlaue.floor()) {
      var carScale = 1 - (currPageVlaue - index) * (1 - _scaleFactor);
      var cartrans = height * (1 - carScale) / 2;
      matrix = Matrix4.diagonal3Values(1, carScale, 1)
        ..setTranslationRaw(1, cartrans, 1);
    } else if (index == currPageVlaue.floor() + 1) {
      var carScale =
          _scaleFactor + (currPageVlaue - index + 1) * (1 - _scaleFactor);
      var cartrans = height * (1 - carScale) / 2;
      matrix = Matrix4.diagonal3Values(1, carScale, 1)
        ..setTranslationRaw(1, cartrans, 1);
    } else if (index == currPageVlaue.floor() - 1) {
      var carScale = 1 - (currPageVlaue - index) * (1 - _scaleFactor);
      var cartrans = height * (1 - carScale) / 2;
      matrix = Matrix4.diagonal3Values(1, carScale, 1)
        ..setTranslationRaw(1, cartrans, 1);
    } else {
      var carScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, carScale, 1)
        ..setTranslationRaw(0, height * (1 - carScale) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              // Get.to(() => PopularFoodDetail());
              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              height: Dimentions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimentions.widtht10, right: Dimentions.widtht10),
              decoration: BoxDecoration(
                  color: index.isEven ? AppColors.mainColor : Colors.blue,
                  borderRadius: BorderRadius.circular(Dimentions.radi30),
                  image: DecorationImage(
                    image: NetworkImage(AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        popularProduct.img!),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimentions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimentions.width30,
                  right: Dimentions.width30,
                  bottom: Dimentions.width30),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 0.5,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 0.5,
                    offset: Offset(5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 0.5,
                    offset: Offset(-5, 0),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimentions.radi30),
              ),
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimentions.widtht15,
                      right: Dimentions.widtht15,
                      top: Dimentions.widtht15),
                  child: AppColumn(bigText: popularProduct.name!)),
            ),
          ),
        ],
      ),
    );
  }
}
