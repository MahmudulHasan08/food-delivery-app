import 'package:flutter/material.dart';
import 'package:fooddeliver/data/controller/popular_product_controller.dart';
import 'package:fooddeliver/data/controller/recommended_product_controller.dart';
import 'package:fooddeliver/pages/food/popular_food_details.dart';
import 'package:fooddeliver/pages/food/recommended_food_detail.dart';
import 'package:fooddeliver/pages/home/food_page_body.dart';
import 'package:fooddeliver/pages/home/main_food_page.dart';

import 'package:fooddeliver/routes/route_helper.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.innt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      // home: MainFoodPage(),

      // initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
