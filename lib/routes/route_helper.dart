import 'package:fooddeliver/pages/food/popular_food_details.dart';
import 'package:fooddeliver/pages/home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:fooddeliver/pages/food/recommended_food_detail.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularfood = "/popular-food";
  static const String recommendedfood = "/recommended-food";

  static String getInitial() => "$initial";
  static String getPopularFood(int pageId) => "$popularfood?pageId=$pageId";
  static String getRecommendedFood(int pageId) =>
      "$recommendedfood?pageId=$pageId";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
      name: popularfood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedfood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return RecommendedFoodDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
  ];
}
