import 'package:fooddeliver/data/api/api_client.dart';
import 'package:fooddeliver/data/controller/cart_controller.dart';
import 'package:fooddeliver/data/controller/popular_product_controller.dart';
import 'package:fooddeliver/data/controller/recommended_product_controller.dart';
import 'package:fooddeliver/data/repository/cart_repo.dart';
import 'package:fooddeliver/data/repository/popular_product_repo.dart';
import 'package:fooddeliver/data/repository/recommended_product_repo.dart';
import 'package:fooddeliver/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> innt() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());
  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
